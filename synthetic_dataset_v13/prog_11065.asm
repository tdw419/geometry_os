; DESCRIPTION: Composite: Renders a blue line between points (223, 83) and (74, 37) then Places a white dot at position (453, 121) then Places a white 27x83 rectangle at position (321, 94).
; PLAN: r0=223(x1), r1=83(y1), r2=74(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=94(y), r12=27(width), r13=83(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 83
LDI r2, 74
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 321
LDI r11, 94
LDI r12, 27
LDI r13, 83
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

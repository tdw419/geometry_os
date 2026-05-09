; DESCRIPTION: Composite: Renders a blue line between points (96, 79) and (102, 192) then Places a blue dot at position (181, 8) then Places a white 75x29 rectangle at position (187, 155).
; PLAN: r0=96(x1), r1=79(y1), r2=102(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=8(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=155(y), r12=75(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 79
LDI r2, 102
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 8
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 187
LDI r11, 155
LDI r12, 75
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a white dot at position (86, 36) then Draws a blue line from (464, 1) to (113, 211) then Places a cyan 51x78 rectangle at position (435, 88).
; PLAN: r0=86(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=1(y1), r7=113(x2), r8=211(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=88(y), r12=51(width), r13=78(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 464
LDI r6, 1
LDI r7, 113
LDI r8, 211
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 88
LDI r12, 51
LDI r13, 78
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Renders a cyan disk with center (490, 188) and radius 14 then Renders a white line between points (485, 89) and (175, 198) then Draws a white rectangle at (257, 110) with width 51 and height 59.
; PLAN: r0=490(x), r1=188(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x1), r6=89(y1), r7=175(x2), r8=198(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=110(y), r12=51(width), r13=59(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 188
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 89
LDI r7, 175
LDI r8, 198
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 110
LDI r12, 51
LDI r13, 59
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

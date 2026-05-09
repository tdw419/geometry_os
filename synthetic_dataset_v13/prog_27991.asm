; DESCRIPTION: Composite: Draws a cyan rectangle at (83, 55) with width 110 and height 17 then Renders a black line between points (22, 33) and (371, 156) then Creates a blue circular shape at (157, 168) with radius 30.
; PLAN: r0=83(x), r1=55(y), r2=110(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x1), r6=33(y1), r7=371(x2), r8=156(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=168(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 55
LDI r2, 110
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 33
LDI r7, 371
LDI r8, 156
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 168
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

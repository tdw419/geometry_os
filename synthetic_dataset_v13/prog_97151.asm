; DESCRIPTION: Composite: Draws a cyan rectangle at (388, 176) with width 52 and height 65 then Renders a blue line between points (264, 135) and (66, 106) then Renders a blue disk with center (153, 99) and radius 14.
; PLAN: r0=388(x), r1=176(y), r2=52(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x1), r6=135(y1), r7=66(x2), r8=106(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=99(y), r12=14(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 176
LDI r2, 52
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 135
LDI r7, 66
LDI r8, 106
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 99
LDI r12, 14
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Sets a single magenta pixel at (78, 158) then Draws a green rectangle at (91, 124) with width 67 and height 106 then Draws a blue circle centered at (110, 119) with radius 65.
; PLAN: r0=78(x), r1=158(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=124(y), r7=67(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x), r11=119(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 158
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 124
LDI r7, 67
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 119
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Draws a purple rectangle at (55, 139) with width 19 and height 30 then Places a magenta line segment connecting (69, 149) to (109, 174) then Creates a white circular shape at (311, 157) with radius 63.
; PLAN: r0=55(x), r1=139(y), r2=19(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=149(y1), r7=109(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=157(y), r12=63(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 139
LDI r2, 19
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 149
LDI r7, 109
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 157
LDI r12, 63
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

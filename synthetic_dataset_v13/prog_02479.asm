; DESCRIPTION: Composite: Places a magenta line segment connecting (437, 180) to (472, 46) then Creates a green rectangular region at (429, 8) spanning 75 by 39 pixels then Draws a blue circle centered at (274, 130) with radius 74.
; PLAN: r0=437(x1), r1=180(y1), r2=472(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=8(y), r7=75(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=130(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 437
LDI r1, 180
LDI r2, 472
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 8
LDI r7, 75
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 130
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

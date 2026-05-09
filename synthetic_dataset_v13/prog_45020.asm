; DESCRIPTION: Composite: Renders a purple box of size 91x20 starting at (274, 208) then Places a purple line segment connecting (367, 140) to (106, 130) then Creates a yellow circular shape at (323, 35) with radius 25.
; PLAN: r0=274(x), r1=208(y), r2=91(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x1), r6=140(y1), r7=106(x2), r8=130(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=35(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 208
LDI r2, 91
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 140
LDI r7, 106
LDI r8, 130
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 35
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

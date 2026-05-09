; DESCRIPTION: Composite: Renders a yellow box of size 111x20 starting at (88, 183) then Sets a single purple pixel at (120, 123) then Draws a purple circle centered at (189, 202) with radius 23.
; PLAN: r0=88(x), r1=183(y), r2=111(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=123(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=202(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 183
LDI r2, 111
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 123
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 189
LDI r11, 202
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

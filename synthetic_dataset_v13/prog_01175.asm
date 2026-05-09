; DESCRIPTION: Composite: Places a blue line segment connecting (214, 158) to (391, 111) then Sets a single green pixel at (499, 214) then Renders a black disk with center (172, 205) and radius 27.
; PLAN: r0=214(x1), r1=158(y1), r2=391(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=214(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=172(x), r11=205(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 158
LDI r2, 391
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 214
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 172
LDI r11, 205
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

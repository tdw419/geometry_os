; DESCRIPTION: Composite: Sets a single purple pixel at (195, 130) then Renders a purple line between points (411, 163) and (352, 232) then Draws a magenta circle centered at (247, 21) with radius 13.
; PLAN: r0=195(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=163(y1), r7=352(x2), r8=232(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=21(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 163
LDI r7, 352
LDI r8, 232
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 21
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

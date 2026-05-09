; DESCRIPTION: Composite: Places a purple line segment connecting (112, 112) to (247, 123) then Places a magenta dot at position (497, 96) then Renders a black disk with center (267, 159) and radius 51.
; PLAN: r0=112(x1), r1=112(y1), r2=247(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=96(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=267(x), r11=159(y), r12=51(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 112
LDI r2, 247
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 96
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 267
LDI r11, 159
LDI r12, 51
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Sets a single blue pixel at (460, 182) then Creates a black circular shape at (310, 178) with radius 22 then Draws a green line from (26, 105) to (195, 68).
; PLAN: r0=460(x), r1=182(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=178(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x1), r11=105(y1), r12=195(x2), r13=68(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 182
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 178
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 105
LDI r12, 195
LDI r13, 68
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

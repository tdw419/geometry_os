; DESCRIPTION: Composite: Sets a single yellow pixel at (245, 96) then Renders a purple disk with center (147, 66) and radius 64 then Places a purple line segment connecting (478, 130) to (361, 206).
; PLAN: r0=245(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=66(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=478(x1), r11=130(y1), r12=361(x2), r13=206(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 147
LDI r6, 66
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 478
LDI r11, 130
LDI r12, 361
LDI r13, 206
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

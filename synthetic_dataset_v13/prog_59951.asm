; DESCRIPTION: Composite: Sets a single green pixel at (99, 145) then Renders a black disk with center (338, 232) and radius 13 then Places a green line segment connecting (112, 100) to (402, 195).
; PLAN: r0=99(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=232(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x1), r11=100(y1), r12=402(x2), r13=195(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 338
LDI r6, 232
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 100
LDI r12, 402
LDI r13, 195
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

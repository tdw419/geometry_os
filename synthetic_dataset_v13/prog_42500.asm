; DESCRIPTION: Composite: Renders a yellow disk with center (148, 107) and radius 79 then Places a black dot at position (332, 37) then Places a purple line segment connecting (352, 31) to (266, 200).
; PLAN: r0=148(x), r1=107(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=37(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=352(x1), r11=31(y1), r12=266(x2), r13=200(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 107
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 37
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 352
LDI r11, 31
LDI r12, 266
LDI r13, 200
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

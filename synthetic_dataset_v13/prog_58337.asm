; DESCRIPTION: Composite: Renders a magenta disk with center (223, 112) and radius 69 then Sets a single blue pixel at (447, 19) then Places a yellow line segment connecting (372, 200) to (194, 15).
; PLAN: r0=223(x), r1=112(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=19(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=372(x1), r11=200(y1), r12=194(x2), r13=15(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 112
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 19
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 372
LDI r11, 200
LDI r12, 194
LDI r13, 15
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

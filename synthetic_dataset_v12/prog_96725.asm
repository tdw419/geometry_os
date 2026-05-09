; DESCRIPTION: Composite: Sets a single blue pixel at (125, 32) then Creates a purple circular shape at (379, 135) with radius 22 then Places a blue line segment connecting (166, 246) to (412, 194).
; PLAN: r0=125(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=135(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x1), r11=246(y1), r12=412(x2), r13=194(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 32
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 135
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 246
LDI r12, 412
LDI r13, 194
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

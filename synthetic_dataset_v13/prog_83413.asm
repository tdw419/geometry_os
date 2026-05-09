; DESCRIPTION: Composite: Draws a black circle centered at (23, 101) with radius 22 then Sets a single blue pixel at (420, 88).
; PLAN: r0=23(x), r1=101(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=88(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 101
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 88
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

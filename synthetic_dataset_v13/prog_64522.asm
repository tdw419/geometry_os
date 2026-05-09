; DESCRIPTION: Composite: Sets a single blue pixel at (366, 12) then Creates a purple circular shape at (328, 48) with radius 15.
; PLAN: r0=366(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=48(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 48
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

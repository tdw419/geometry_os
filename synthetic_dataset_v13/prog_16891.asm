; DESCRIPTION: Composite: Sets a single red pixel at (501, 72) then Creates a blue circular shape at (402, 30) with radius 19.
; PLAN: r0=501(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=30(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 501
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 402
LDI r6, 30
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

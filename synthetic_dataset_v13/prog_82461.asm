; DESCRIPTION: Composite: Creates a green circular shape at (428, 88) with radius 64 then Sets a single blue pixel at (443, 215).
; PLAN: r0=428(x), r1=88(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=215(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 428
LDI r1, 88
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 215
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

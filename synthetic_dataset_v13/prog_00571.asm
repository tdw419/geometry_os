; DESCRIPTION: Composite: Creates a red circular shape at (209, 150) with radius 42 then Sets a single blue pixel at (496, 116).
; PLAN: r0=209(x), r1=150(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x), r6=116(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 150
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 116
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

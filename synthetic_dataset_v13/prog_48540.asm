; DESCRIPTION: Creates a black circular shape at (449, 74) with radius 48.
; PLAN: r0=449(x), r1=74(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 74
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a green circular shape at (449, 74) with radius 43.
; PLAN: r0=449(x), r1=74(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 74
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

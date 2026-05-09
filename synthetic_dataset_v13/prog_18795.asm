; DESCRIPTION: Creates a blue circular shape at (471, 215) with radius 26.
; PLAN: r0=471(x), r1=215(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 215
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

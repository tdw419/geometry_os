; DESCRIPTION: Creates a blue circular shape at (361, 195) with radius 50.
; PLAN: r0=361(x), r1=195(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 195
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

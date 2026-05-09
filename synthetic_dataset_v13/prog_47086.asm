; DESCRIPTION: Creates a black circular shape at (401, 195) with radius 30.
; PLAN: r0=401(x), r1=195(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 195
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

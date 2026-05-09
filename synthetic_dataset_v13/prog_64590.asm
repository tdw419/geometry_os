; DESCRIPTION: Creates a black circular shape at (401, 86) with radius 19.
; PLAN: r0=401(x), r1=86(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 86
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

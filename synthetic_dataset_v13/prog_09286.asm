; DESCRIPTION: Creates a black circular shape at (401, 93) with radius 70.
; PLAN: r0=401(x), r1=93(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 93
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

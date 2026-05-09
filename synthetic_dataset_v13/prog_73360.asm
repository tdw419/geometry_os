; DESCRIPTION: Creates a black circular shape at (262, 180) with radius 63.
; PLAN: r0=262(x), r1=180(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 180
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

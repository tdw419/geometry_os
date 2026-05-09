; DESCRIPTION: Creates a black circular shape at (262, 36) with radius 14.
; PLAN: r0=262(x), r1=36(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 36
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

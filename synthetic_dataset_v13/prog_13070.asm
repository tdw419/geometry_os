; DESCRIPTION: Creates a blue circular shape at (262, 145) with radius 15.
; PLAN: r0=262(x), r1=145(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 145
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a green circular shape at (262, 172) with radius 51.
; PLAN: r0=262(x), r1=172(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 172
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

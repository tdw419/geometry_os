; DESCRIPTION: Creates a blue circular shape at (27, 179) with radius 10.
; PLAN: r0=27(x), r1=179(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 179
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a green circular shape at (133, 179) with radius 27.
; PLAN: r0=133(x), r1=179(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 179
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

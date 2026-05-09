; DESCRIPTION: Creates a green circular shape at (179, 235) with radius 18.
; PLAN: r0=179(x), r1=235(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 235
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

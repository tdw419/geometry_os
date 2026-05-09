; DESCRIPTION: Creates a green circular shape at (235, 164) with radius 38.
; PLAN: r0=235(x), r1=164(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 164
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

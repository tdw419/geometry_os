; DESCRIPTION: Creates a green circular shape at (157, 106) with radius 79.
; PLAN: r0=157(x), r1=106(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 106
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

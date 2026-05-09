; DESCRIPTION: Creates a green circular shape at (157, 174) with radius 39.
; PLAN: r0=157(x), r1=174(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 174
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a green circular shape at (249, 139) with radius 79.
; PLAN: r0=249(x), r1=139(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 139
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

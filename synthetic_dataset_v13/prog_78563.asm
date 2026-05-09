; DESCRIPTION: Creates a green circular shape at (330, 106) with radius 31.
; PLAN: r0=330(x), r1=106(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 106
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

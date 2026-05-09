; DESCRIPTION: Creates a green circular shape at (150, 174) with radius 31.
; PLAN: r0=150(x), r1=174(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 174
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

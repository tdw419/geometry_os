; DESCRIPTION: Creates a green circular shape at (130, 140) with radius 63.
; PLAN: r0=130(x), r1=140(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 140
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

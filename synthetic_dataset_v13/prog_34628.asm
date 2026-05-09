; DESCRIPTION: Creates a green circular shape at (391, 158) with radius 63.
; PLAN: r0=391(x), r1=158(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 158
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

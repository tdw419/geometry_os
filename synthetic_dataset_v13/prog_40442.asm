; DESCRIPTION: Renders a black disk with center (310, 117) and radius 63.
; PLAN: r0=310(x), r1=117(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 117
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

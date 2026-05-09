; DESCRIPTION: Renders a orange disk with center (49, 132) and radius 31.
; PLAN: r0=49(x), r1=132(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 132
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

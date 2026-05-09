; DESCRIPTION: Renders a orange disk with center (291, 132) and radius 73.
; PLAN: r0=291(x), r1=132(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 132
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

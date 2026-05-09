; DESCRIPTION: Renders a orange disk with center (334, 185) and radius 32.
; PLAN: r0=334(x), r1=185(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 185
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

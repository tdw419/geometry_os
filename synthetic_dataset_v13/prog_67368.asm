; DESCRIPTION: Renders a orange disk with center (461, 32) and radius 26.
; PLAN: r0=461(x), r1=32(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 32
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

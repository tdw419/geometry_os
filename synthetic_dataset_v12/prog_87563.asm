; DESCRIPTION: Renders a orange disk with center (345, 140) and radius 49.
; PLAN: r0=345(x), r1=140(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 140
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

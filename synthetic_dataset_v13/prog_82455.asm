; DESCRIPTION: Renders a orange disk with center (321, 73) and radius 53.
; PLAN: r0=321(x), r1=73(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 73
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

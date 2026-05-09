; DESCRIPTION: Renders a orange disk with center (336, 69) and radius 53.
; PLAN: r0=336(x), r1=69(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 69
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

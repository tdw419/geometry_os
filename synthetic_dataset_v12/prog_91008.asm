; DESCRIPTION: Renders a orange disk with center (148, 39) and radius 11.
; PLAN: r0=148(x), r1=39(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 39
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

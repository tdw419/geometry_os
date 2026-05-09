; DESCRIPTION: Renders a orange disk with center (405, 49) and radius 33.
; PLAN: r0=405(x), r1=49(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 49
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

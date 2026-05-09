; DESCRIPTION: Renders a orange disk with center (405, 191) and radius 34.
; PLAN: r0=405(x), r1=191(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 191
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a orange disk with center (405, 77) and radius 40.
; PLAN: r0=405(x), r1=77(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 77
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

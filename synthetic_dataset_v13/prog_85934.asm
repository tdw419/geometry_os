; DESCRIPTION: Renders a black disk with center (405, 50) and radius 40.
; PLAN: r0=405(x), r1=50(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 50
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

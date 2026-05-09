; DESCRIPTION: Renders a white disk with center (405, 98) and radius 72.
; PLAN: r0=405(x), r1=98(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 98
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

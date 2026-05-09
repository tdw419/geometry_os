; DESCRIPTION: Renders a white disk with center (449, 211) and radius 15.
; PLAN: r0=449(x), r1=211(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 211
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (52, 87) and radius 52.
; PLAN: r0=52(x), r1=87(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 87
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

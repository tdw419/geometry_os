; DESCRIPTION: Renders a white disk with center (130, 26) and radius 12.
; PLAN: r0=130(x), r1=26(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 26
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

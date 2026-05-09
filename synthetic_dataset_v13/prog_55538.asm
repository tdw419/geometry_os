; DESCRIPTION: Renders a white disk with center (370, 177) and radius 30.
; PLAN: r0=370(x), r1=177(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 177
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

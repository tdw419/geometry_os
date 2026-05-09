; DESCRIPTION: Renders a white disk with center (200, 21) and radius 15.
; PLAN: r0=200(x), r1=21(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 21
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (200, 39) and radius 18.
; PLAN: r0=200(x), r1=39(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 39
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (419, 230) and radius 14.
; PLAN: r0=419(x), r1=230(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 230
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (382, 164) and radius 62.
; PLAN: r0=382(x), r1=164(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 164
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

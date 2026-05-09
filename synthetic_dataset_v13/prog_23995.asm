; DESCRIPTION: Renders a white disk with center (92, 76) and radius 69.
; PLAN: r0=92(x), r1=76(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 76
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (92, 210) and radius 13.
; PLAN: r0=92(x), r1=210(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 210
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

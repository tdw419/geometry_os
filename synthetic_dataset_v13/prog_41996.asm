; DESCRIPTION: Renders a white disk with center (240, 163) and radius 19.
; PLAN: r0=240(x), r1=163(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 163
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

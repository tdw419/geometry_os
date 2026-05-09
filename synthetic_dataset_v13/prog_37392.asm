; DESCRIPTION: Renders a white disk with center (151, 115) and radius 59.
; PLAN: r0=151(x), r1=115(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 115
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

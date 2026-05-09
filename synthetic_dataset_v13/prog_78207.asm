; DESCRIPTION: Renders a black disk with center (415, 138) and radius 40.
; PLAN: r0=415(x), r1=138(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 138
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

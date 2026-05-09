; DESCRIPTION: Renders a black disk with center (415, 95) and radius 47.
; PLAN: r0=415(x), r1=95(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 95
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

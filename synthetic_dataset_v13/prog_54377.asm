; DESCRIPTION: Renders a white disk with center (44, 96) and radius 29.
; PLAN: r0=44(x), r1=96(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 96
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

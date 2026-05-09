; DESCRIPTION: Renders a white disk with center (260, 157) and radius 33.
; PLAN: r0=260(x), r1=157(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 157
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

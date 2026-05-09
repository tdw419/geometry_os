; DESCRIPTION: Renders a white disk with center (386, 227) and radius 11.
; PLAN: r0=386(x), r1=227(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 227
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

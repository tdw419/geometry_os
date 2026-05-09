; DESCRIPTION: Renders a white disk with center (260, 176) and radius 34.
; PLAN: r0=260(x), r1=176(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 176
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (263, 176) and radius 38.
; PLAN: r0=263(x), r1=176(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 176
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

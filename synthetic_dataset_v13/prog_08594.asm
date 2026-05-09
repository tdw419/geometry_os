; DESCRIPTION: Renders a white disk with center (282, 186) and radius 31.
; PLAN: r0=282(x), r1=186(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 186
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

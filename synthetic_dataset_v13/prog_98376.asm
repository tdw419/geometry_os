; DESCRIPTION: Renders a white disk with center (411, 110) and radius 21.
; PLAN: r0=411(x), r1=110(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 110
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

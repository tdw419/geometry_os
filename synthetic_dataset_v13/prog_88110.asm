; DESCRIPTION: Renders a white disk with center (350, 153) and radius 31.
; PLAN: r0=350(x), r1=153(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 153
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

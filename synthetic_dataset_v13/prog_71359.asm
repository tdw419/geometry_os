; DESCRIPTION: Renders a white disk with center (462, 153) and radius 50.
; PLAN: r0=462(x), r1=153(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 153
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

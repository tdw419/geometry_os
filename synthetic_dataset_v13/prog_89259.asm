; DESCRIPTION: Renders a white disk with center (455, 153) and radius 53.
; PLAN: r0=455(x), r1=153(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 153
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

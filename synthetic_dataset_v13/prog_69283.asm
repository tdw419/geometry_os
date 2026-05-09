; DESCRIPTION: Renders a blue disk with center (113, 153) and radius 76.
; PLAN: r0=113(x), r1=153(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 153
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

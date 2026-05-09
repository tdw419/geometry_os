; DESCRIPTION: Renders a purple disk with center (149, 153) and radius 24.
; PLAN: r0=149(x), r1=153(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 153
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

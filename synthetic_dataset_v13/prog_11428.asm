; DESCRIPTION: Renders a blue disk with center (102, 179) and radius 73.
; PLAN: r0=102(x), r1=179(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 179
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

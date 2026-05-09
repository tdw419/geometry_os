; DESCRIPTION: Renders a blue disk with center (297, 92) and radius 77.
; PLAN: r0=297(x), r1=92(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 92
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

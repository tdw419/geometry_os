; DESCRIPTION: Renders a blue disk with center (411, 156) and radius 77.
; PLAN: r0=411(x), r1=156(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 156
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

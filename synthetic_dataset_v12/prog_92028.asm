; DESCRIPTION: Renders a blue disk with center (355, 151) and radius 77.
; PLAN: r0=355(x), r1=151(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 151
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a blue circle of radius 77 at center (355, 96).
; PLAN: r0=355(x), r1=96(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 96
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

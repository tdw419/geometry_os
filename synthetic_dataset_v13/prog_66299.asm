; DESCRIPTION: Places a blue circle of radius 54 at center (226, 96).
; PLAN: r0=226(x), r1=96(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 96
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

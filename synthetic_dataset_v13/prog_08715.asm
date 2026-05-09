; DESCRIPTION: Places a blue circle of radius 64 at center (222, 77).
; PLAN: r0=222(x), r1=77(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 77
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a blue circle of radius 35 at center (285, 116).
; PLAN: r0=285(x), r1=116(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 116
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

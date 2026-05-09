; DESCRIPTION: Places a blue circle of radius 62 at center (447, 125).
; PLAN: r0=447(x), r1=125(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 125
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

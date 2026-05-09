; DESCRIPTION: Places a purple circle of radius 21 at center (447, 38).
; PLAN: r0=447(x), r1=38(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 38
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

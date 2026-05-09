; DESCRIPTION: Places a purple circle of radius 31 at center (419, 113).
; PLAN: r0=419(x), r1=113(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 113
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

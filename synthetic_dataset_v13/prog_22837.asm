; DESCRIPTION: Places a purple circle of radius 24 at center (420, 180).
; PLAN: r0=420(x), r1=180(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 180
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

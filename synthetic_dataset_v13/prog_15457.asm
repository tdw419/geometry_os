; DESCRIPTION: Places a purple circle of radius 78 at center (415, 84).
; PLAN: r0=415(x), r1=84(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 84
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 64 at center (415, 176).
; PLAN: r0=415(x), r1=176(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 176
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

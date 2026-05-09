; DESCRIPTION: Places a purple circle of radius 76 at center (192, 113).
; PLAN: r0=192(x), r1=113(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 113
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

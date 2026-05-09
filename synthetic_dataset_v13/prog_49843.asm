; DESCRIPTION: Places a purple circle of radius 39 at center (420, 56).
; PLAN: r0=420(x), r1=56(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 56
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

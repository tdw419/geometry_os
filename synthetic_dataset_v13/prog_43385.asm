; DESCRIPTION: Places a purple circle of radius 56 at center (263, 59).
; PLAN: r0=263(x), r1=59(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 59
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

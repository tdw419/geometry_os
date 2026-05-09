; DESCRIPTION: Places a blue circle of radius 56 at center (128, 73).
; PLAN: r0=128(x), r1=73(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 73
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

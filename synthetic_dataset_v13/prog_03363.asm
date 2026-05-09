; DESCRIPTION: Places a blue circle of radius 19 at center (86, 156).
; PLAN: r0=86(x), r1=156(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 156
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

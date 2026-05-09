; DESCRIPTION: Places a blue circle of radius 15 at center (384, 160).
; PLAN: r0=384(x), r1=160(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 160
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

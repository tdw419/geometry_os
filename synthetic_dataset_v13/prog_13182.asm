; DESCRIPTION: Places a purple circle of radius 65 at center (384, 144).
; PLAN: r0=384(x), r1=144(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 144
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

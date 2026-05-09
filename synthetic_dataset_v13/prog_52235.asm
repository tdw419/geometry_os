; DESCRIPTION: Places a yellow circle of radius 30 at center (384, 132).
; PLAN: r0=384(x), r1=132(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 132
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

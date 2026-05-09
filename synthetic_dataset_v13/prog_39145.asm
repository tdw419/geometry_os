; DESCRIPTION: Places a yellow circle of radius 13 at center (384, 73).
; PLAN: r0=384(x), r1=73(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 73
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

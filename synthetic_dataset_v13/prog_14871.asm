; DESCRIPTION: Places a yellow circle of radius 60 at center (358, 88).
; PLAN: r0=358(x), r1=88(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 88
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

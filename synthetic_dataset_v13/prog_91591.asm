; DESCRIPTION: Places a yellow circle of radius 64 at center (436, 158).
; PLAN: r0=436(x), r1=158(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 158
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 26 at center (370, 227).
; PLAN: r0=370(x), r1=227(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 227
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

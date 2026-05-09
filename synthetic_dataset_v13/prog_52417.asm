; DESCRIPTION: Places a magenta circle of radius 17 at center (258, 227).
; PLAN: r0=258(x), r1=227(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 227
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 73 at center (204, 98).
; PLAN: r0=204(x), r1=98(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 98
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

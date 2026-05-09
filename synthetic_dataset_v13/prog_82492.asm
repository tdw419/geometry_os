; DESCRIPTION: Places a magenta circle of radius 19 at center (304, 30).
; PLAN: r0=304(x), r1=30(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 30
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

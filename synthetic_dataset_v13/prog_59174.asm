; DESCRIPTION: Places a magenta circle of radius 67 at center (98, 73).
; PLAN: r0=98(x), r1=73(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 73
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

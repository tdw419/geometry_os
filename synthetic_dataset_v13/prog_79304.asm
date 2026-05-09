; DESCRIPTION: Places a magenta circle of radius 46 at center (419, 67).
; PLAN: r0=419(x), r1=67(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 67
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

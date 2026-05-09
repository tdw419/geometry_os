; DESCRIPTION: Places a magenta circle of radius 39 at center (261, 84).
; PLAN: r0=261(x), r1=84(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 84
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

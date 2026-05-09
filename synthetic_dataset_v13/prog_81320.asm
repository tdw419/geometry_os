; DESCRIPTION: Places a magenta circle of radius 80 at center (157, 101).
; PLAN: r0=157(x), r1=101(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 101
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

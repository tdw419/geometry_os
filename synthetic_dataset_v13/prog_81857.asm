; DESCRIPTION: Places a magenta circle of radius 18 at center (297, 135).
; PLAN: r0=297(x), r1=135(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 135
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 25 at center (129, 135).
; PLAN: r0=129(x), r1=135(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 135
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

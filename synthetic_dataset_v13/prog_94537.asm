; DESCRIPTION: Places a magenta circle of radius 24 at center (471, 197).
; PLAN: r0=471(x), r1=197(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 197
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

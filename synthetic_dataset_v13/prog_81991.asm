; DESCRIPTION: Places a magenta circle of radius 24 at center (105, 159).
; PLAN: r0=105(x), r1=159(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 159
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 77 at center (366, 159).
; PLAN: r0=366(x), r1=159(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 159
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

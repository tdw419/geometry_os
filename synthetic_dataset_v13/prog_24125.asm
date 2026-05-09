; DESCRIPTION: Places a magenta circle of radius 17 at center (371, 159).
; PLAN: r0=371(x), r1=159(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 159
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

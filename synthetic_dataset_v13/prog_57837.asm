; DESCRIPTION: Places a magenta circle of radius 17 at center (471, 150).
; PLAN: r0=471(x), r1=150(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 150
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

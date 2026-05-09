; DESCRIPTION: Places a magenta circle of radius 12 at center (126, 155).
; PLAN: r0=126(x), r1=155(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 155
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

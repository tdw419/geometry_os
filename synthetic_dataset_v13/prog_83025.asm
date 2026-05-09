; DESCRIPTION: Places a magenta circle of radius 37 at center (225, 159).
; PLAN: r0=225(x), r1=159(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 159
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

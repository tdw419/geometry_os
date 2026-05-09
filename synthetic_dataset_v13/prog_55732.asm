; DESCRIPTION: Places a magenta circle of radius 60 at center (188, 98).
; PLAN: r0=188(x), r1=98(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 98
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

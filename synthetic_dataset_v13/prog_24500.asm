; DESCRIPTION: Places a magenta circle of radius 70 at center (119, 167).
; PLAN: r0=119(x), r1=167(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 167
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 73 at center (385, 167).
; PLAN: r0=385(x), r1=167(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 167
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

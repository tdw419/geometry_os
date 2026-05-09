; DESCRIPTION: Places a magenta circle of radius 24 at center (352, 93).
; PLAN: r0=352(x), r1=93(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 93
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 39 at center (345, 95).
; PLAN: r0=345(x), r1=95(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 95
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

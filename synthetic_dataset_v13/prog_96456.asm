; DESCRIPTION: Places a magenta circle of radius 73 at center (216, 95).
; PLAN: r0=216(x), r1=95(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 95
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

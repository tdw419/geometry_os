; DESCRIPTION: Places a magenta circle of radius 36 at center (375, 162).
; PLAN: r0=375(x), r1=162(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 162
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

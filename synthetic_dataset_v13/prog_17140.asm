; DESCRIPTION: Places a magenta circle of radius 72 at center (123, 162).
; PLAN: r0=123(x), r1=162(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 162
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

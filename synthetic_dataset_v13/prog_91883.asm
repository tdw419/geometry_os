; DESCRIPTION: Places a magenta circle of radius 60 at center (123, 170).
; PLAN: r0=123(x), r1=170(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 170
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

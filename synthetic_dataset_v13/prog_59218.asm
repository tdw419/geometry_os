; DESCRIPTION: Places a magenta circle of radius 67 at center (357, 123).
; PLAN: r0=357(x), r1=123(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 123
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

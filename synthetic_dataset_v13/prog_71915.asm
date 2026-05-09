; DESCRIPTION: Places a magenta circle of radius 73 at center (357, 160).
; PLAN: r0=357(x), r1=160(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 160
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

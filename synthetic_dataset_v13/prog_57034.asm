; DESCRIPTION: Places a magenta circle of radius 66 at center (165, 109).
; PLAN: r0=165(x), r1=109(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 109
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

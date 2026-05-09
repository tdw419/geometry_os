; DESCRIPTION: Places a magenta circle of radius 73 at center (229, 129).
; PLAN: r0=229(x), r1=129(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 129
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

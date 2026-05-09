; DESCRIPTION: Places a magenta circle of radius 63 at center (77, 133).
; PLAN: r0=77(x), r1=133(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 133
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

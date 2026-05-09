; DESCRIPTION: Places a magenta circle of radius 63 at center (301, 112).
; PLAN: r0=301(x), r1=112(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 112
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

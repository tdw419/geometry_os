; DESCRIPTION: Places a magenta circle of radius 52 at center (301, 58).
; PLAN: r0=301(x), r1=58(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 58
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

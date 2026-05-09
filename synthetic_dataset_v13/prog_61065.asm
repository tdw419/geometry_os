; DESCRIPTION: Places a magenta circle of radius 49 at center (361, 108).
; PLAN: r0=361(x), r1=108(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 108
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

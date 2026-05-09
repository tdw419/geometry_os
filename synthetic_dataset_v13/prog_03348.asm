; DESCRIPTION: Places a magenta circle of radius 18 at center (322, 78).
; PLAN: r0=322(x), r1=78(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 78
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

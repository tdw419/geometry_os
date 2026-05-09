; DESCRIPTION: Places a magenta circle of radius 71 at center (151, 78).
; PLAN: r0=151(x), r1=78(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 78
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

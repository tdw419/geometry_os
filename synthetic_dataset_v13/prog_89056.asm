; DESCRIPTION: Places a magenta circle of radius 49 at center (218, 77).
; PLAN: r0=218(x), r1=77(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 77
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

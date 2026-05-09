; DESCRIPTION: Places a magenta circle of radius 77 at center (230, 85).
; PLAN: r0=230(x), r1=85(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 85
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

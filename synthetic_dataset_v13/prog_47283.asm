; DESCRIPTION: Places a magenta circle of radius 38 at center (102, 90).
; PLAN: r0=102(x), r1=90(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 90
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a magenta circle of radius 14 at center (322, 178).
; PLAN: r0=322(x), r1=178(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 178
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

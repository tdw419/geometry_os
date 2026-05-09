; DESCRIPTION: Places a magenta circle of radius 77 at center (353, 144).
; PLAN: r0=353(x), r1=144(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 144
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

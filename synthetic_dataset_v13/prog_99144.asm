; DESCRIPTION: Places a magenta circle of radius 75 at center (353, 176).
; PLAN: r0=353(x), r1=176(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 176
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

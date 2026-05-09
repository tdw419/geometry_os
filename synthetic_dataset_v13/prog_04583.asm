; DESCRIPTION: Places a magenta circle of radius 15 at center (425, 188).
; PLAN: r0=425(x), r1=188(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 188
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

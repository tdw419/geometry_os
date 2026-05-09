; DESCRIPTION: Places a magenta circle of radius 30 at center (208, 191).
; PLAN: r0=208(x), r1=191(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 191
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

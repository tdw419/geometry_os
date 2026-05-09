; DESCRIPTION: Places a blue circle of radius 63 at center (427, 177).
; PLAN: r0=427(x), r1=177(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 177
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

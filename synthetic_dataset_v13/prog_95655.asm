; DESCRIPTION: Places a blue circle of radius 30 at center (114, 179).
; PLAN: r0=114(x), r1=179(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 179
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

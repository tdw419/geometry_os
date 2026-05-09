; DESCRIPTION: Creates a blue circular shape at (382, 106) with radius 25.
; PLAN: r0=382(x), r1=106(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 106
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

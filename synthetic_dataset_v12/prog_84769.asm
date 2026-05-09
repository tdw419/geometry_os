; DESCRIPTION: Creates a blue circular shape at (144, 131) with radius 43.
; PLAN: r0=144(x), r1=131(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 131
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

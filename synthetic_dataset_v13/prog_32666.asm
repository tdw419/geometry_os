; DESCRIPTION: Creates a blue circular shape at (74, 178) with radius 62.
; PLAN: r0=74(x), r1=178(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 178
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

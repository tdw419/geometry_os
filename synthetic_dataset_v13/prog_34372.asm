; DESCRIPTION: Creates a blue circular shape at (74, 203) with radius 38.
; PLAN: r0=74(x), r1=203(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 203
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

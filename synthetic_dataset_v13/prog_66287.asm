; DESCRIPTION: Creates a blue circular shape at (74, 90) with radius 70.
; PLAN: r0=74(x), r1=90(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 90
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a blue circular shape at (306, 100) with radius 20.
; PLAN: r0=306(x), r1=100(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 100
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

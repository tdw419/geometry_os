; DESCRIPTION: Creates a blue circular shape at (196, 175) with radius 74.
; PLAN: r0=196(x), r1=175(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 175
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

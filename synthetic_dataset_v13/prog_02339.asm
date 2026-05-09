; DESCRIPTION: Creates a blue circular shape at (286, 217) with radius 16.
; PLAN: r0=286(x), r1=217(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 217
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

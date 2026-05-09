; DESCRIPTION: Creates a blue circular shape at (187, 99) with radius 77.
; PLAN: r0=187(x), r1=99(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 99
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

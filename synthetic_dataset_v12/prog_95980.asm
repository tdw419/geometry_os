; DESCRIPTION: Creates a green circular shape at (117, 118) with radius 38.
; PLAN: r0=117(x), r1=118(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 118
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

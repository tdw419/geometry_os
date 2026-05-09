; DESCRIPTION: Draws a white circle centered at (201, 118) with radius 80.
; PLAN: r0=201(x), r1=118(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 118
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

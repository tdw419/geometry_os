; DESCRIPTION: Draws a white circle centered at (388, 118) with radius 32.
; PLAN: r0=388(x), r1=118(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 118
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

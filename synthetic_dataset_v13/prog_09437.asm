; DESCRIPTION: Draws a white circle centered at (448, 172) with radius 60.
; PLAN: r0=448(x), r1=172(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 172
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

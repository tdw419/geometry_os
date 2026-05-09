; DESCRIPTION: Draws a blue circle centered at (278, 162) with radius 77.
; PLAN: r0=278(x), r1=162(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 162
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

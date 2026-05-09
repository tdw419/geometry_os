; DESCRIPTION: Draws a blue circle centered at (200, 120) with radius 77.
; PLAN: r0=200(x), r1=120(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 120
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

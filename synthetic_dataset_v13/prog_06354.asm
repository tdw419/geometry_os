; DESCRIPTION: Draws a blue circle centered at (84, 126) with radius 77.
; PLAN: r0=84(x), r1=126(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 126
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

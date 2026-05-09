; DESCRIPTION: Draws a blue circle centered at (389, 143) with radius 80.
; PLAN: r0=389(x), r1=143(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 143
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

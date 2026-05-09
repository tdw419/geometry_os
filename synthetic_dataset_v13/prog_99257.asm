; DESCRIPTION: Draws a blue circle centered at (293, 109) with radius 80.
; PLAN: r0=293(x), r1=109(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 109
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

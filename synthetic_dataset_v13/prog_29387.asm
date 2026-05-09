; DESCRIPTION: Draws a blue circle centered at (83, 109) with radius 72.
; PLAN: r0=83(x), r1=109(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 109
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

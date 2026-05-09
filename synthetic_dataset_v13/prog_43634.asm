; DESCRIPTION: Draws a blue circle centered at (251, 120) with radius 80.
; PLAN: r0=251(x), r1=120(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 120
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

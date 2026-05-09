; DESCRIPTION: Draws a blue circle centered at (325, 146) with radius 75.
; PLAN: r0=325(x), r1=146(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 146
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

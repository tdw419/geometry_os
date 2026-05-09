; DESCRIPTION: Draws a blue circle centered at (493, 193) with radius 12.
; PLAN: r0=493(x), r1=193(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 193
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

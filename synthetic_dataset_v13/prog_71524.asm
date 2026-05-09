; DESCRIPTION: Draws a blue circle centered at (365, 86) with radius 70.
; PLAN: r0=365(x), r1=86(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 86
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

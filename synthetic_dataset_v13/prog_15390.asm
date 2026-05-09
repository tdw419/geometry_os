; DESCRIPTION: Draws a blue circle centered at (387, 79) with radius 70.
; PLAN: r0=387(x), r1=79(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 79
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

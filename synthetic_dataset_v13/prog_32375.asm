; DESCRIPTION: Draws a blue circle centered at (117, 70) with radius 57.
; PLAN: r0=117(x), r1=70(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 70
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

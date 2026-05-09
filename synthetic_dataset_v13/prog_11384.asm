; DESCRIPTION: Draws a purple circle centered at (410, 149) with radius 70.
; PLAN: r0=410(x), r1=149(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 149
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

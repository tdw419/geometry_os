; DESCRIPTION: Draws a purple circle centered at (464, 39) with radius 18.
; PLAN: r0=464(x), r1=39(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 39
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a purple circle centered at (96, 57) with radius 16.
; PLAN: r0=96(x), r1=57(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 57
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

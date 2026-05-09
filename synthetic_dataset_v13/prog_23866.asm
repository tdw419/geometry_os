; DESCRIPTION: Draws a purple circle centered at (281, 96) with radius 47.
; PLAN: r0=281(x), r1=96(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 96
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

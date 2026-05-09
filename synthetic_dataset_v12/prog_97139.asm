; DESCRIPTION: Draws a purple circle centered at (213, 151) with radius 47.
; PLAN: r0=213(x), r1=151(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 151
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

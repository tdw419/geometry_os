; DESCRIPTION: Draws a purple circle centered at (344, 109) with radius 43.
; PLAN: r0=344(x), r1=109(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 109
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

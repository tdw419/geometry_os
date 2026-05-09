; DESCRIPTION: Draws a purple circle centered at (248, 77) with radius 34.
; PLAN: r0=248(x), r1=77(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 77
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

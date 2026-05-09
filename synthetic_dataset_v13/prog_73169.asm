; DESCRIPTION: Draws a purple circle centered at (294, 81) with radius 77.
; PLAN: r0=294(x), r1=81(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 81
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

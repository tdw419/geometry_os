; DESCRIPTION: Draws a yellow circle centered at (338, 122) with radius 61.
; PLAN: r0=338(x), r1=122(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 122
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

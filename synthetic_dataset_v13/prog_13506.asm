; DESCRIPTION: Draws a yellow circle centered at (217, 160) with radius 49.
; PLAN: r0=217(x), r1=160(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 160
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

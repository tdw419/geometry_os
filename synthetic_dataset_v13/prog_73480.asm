; DESCRIPTION: Draws a yellow circle centered at (74, 185) with radius 33.
; PLAN: r0=74(x), r1=185(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 185
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

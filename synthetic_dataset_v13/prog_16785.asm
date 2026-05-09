; DESCRIPTION: Draws a yellow circle centered at (74, 141) with radius 19.
; PLAN: r0=74(x), r1=141(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 141
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

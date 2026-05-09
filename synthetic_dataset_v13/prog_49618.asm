; DESCRIPTION: Draws a yellow circle centered at (121, 90) with radius 75.
; PLAN: r0=121(x), r1=90(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 90
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

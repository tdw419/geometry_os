; DESCRIPTION: Draws a yellow circle centered at (207, 115) with radius 43.
; PLAN: r0=207(x), r1=115(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 115
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

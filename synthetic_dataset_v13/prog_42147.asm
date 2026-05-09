; DESCRIPTION: Draws a yellow circle centered at (437, 188) with radius 53.
; PLAN: r0=437(x), r1=188(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 188
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

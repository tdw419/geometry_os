; DESCRIPTION: Draws a yellow circle centered at (437, 179) with radius 75.
; PLAN: r0=437(x), r1=179(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 179
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (179, 119) with radius 80.
; PLAN: r0=179(x), r1=119(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 119
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

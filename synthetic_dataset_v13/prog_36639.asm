; DESCRIPTION: Draws a green circle centered at (179, 44) with radius 23.
; PLAN: r0=179(x), r1=44(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 44
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

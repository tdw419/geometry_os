; DESCRIPTION: Draws a green circle centered at (268, 80) with radius 74.
; PLAN: r0=268(x), r1=80(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 80
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

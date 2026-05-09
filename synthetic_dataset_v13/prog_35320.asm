; DESCRIPTION: Draws a green circle centered at (268, 153) with radius 28.
; PLAN: r0=268(x), r1=153(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 153
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

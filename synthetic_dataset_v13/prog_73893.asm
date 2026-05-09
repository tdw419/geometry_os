; DESCRIPTION: Draws a green circle centered at (124, 33) with radius 29.
; PLAN: r0=124(x), r1=33(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 33
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

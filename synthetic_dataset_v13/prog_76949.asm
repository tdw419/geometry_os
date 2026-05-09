; DESCRIPTION: Draws a green circle centered at (81, 117) with radius 44.
; PLAN: r0=81(x), r1=117(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 117
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

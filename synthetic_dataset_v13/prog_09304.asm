; DESCRIPTION: Draws a green circle centered at (34, 117) with radius 24.
; PLAN: r0=34(x), r1=117(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 117
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

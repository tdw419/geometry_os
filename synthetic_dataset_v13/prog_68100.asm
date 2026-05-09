; DESCRIPTION: Draws a green circle centered at (90, 35) with radius 25.
; PLAN: r0=90(x), r1=35(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 35
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

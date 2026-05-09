; DESCRIPTION: Draws a green circle centered at (44, 180) with radius 18.
; PLAN: r0=44(x), r1=180(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 180
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

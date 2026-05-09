; DESCRIPTION: Draws a green circle centered at (386, 118) with radius 31.
; PLAN: r0=386(x), r1=118(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 118
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

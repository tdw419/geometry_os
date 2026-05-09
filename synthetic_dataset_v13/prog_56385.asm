; DESCRIPTION: Draws a green circle centered at (118, 111) with radius 78.
; PLAN: r0=118(x), r1=111(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 111
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

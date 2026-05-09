; DESCRIPTION: Draws a green circle centered at (460, 118) with radius 23.
; PLAN: r0=460(x), r1=118(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 118
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

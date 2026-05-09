; DESCRIPTION: Draws a green circle centered at (84, 92) with radius 68.
; PLAN: r0=84(x), r1=92(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 92
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

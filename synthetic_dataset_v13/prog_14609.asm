; DESCRIPTION: Draws a green circle centered at (153, 92) with radius 59.
; PLAN: r0=153(x), r1=92(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 92
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

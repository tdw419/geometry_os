; DESCRIPTION: Draws a green circle centered at (82, 92) with radius 26.
; PLAN: r0=82(x), r1=92(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 92
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

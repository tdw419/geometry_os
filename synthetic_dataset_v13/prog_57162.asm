; DESCRIPTION: Draws a green circle centered at (342, 76) with radius 61.
; PLAN: r0=342(x), r1=76(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 76
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

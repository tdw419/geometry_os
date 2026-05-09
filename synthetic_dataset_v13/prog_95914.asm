; DESCRIPTION: Draws a red circle centered at (122, 81) with radius 30.
; PLAN: r0=122(x), r1=81(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 81
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

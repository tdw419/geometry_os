; DESCRIPTION: Draws a red circle centered at (315, 117) with radius 76.
; PLAN: r0=315(x), r1=117(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 117
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

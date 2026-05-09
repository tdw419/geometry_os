; DESCRIPTION: Draws a red circle centered at (315, 138) with radius 30.
; PLAN: r0=315(x), r1=138(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 138
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

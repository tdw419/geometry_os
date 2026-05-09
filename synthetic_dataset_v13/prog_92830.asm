; DESCRIPTION: Draws a red circle centered at (140, 104) with radius 73.
; PLAN: r0=140(x), r1=104(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 104
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

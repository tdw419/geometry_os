; DESCRIPTION: Draws a red circle centered at (297, 34) with radius 11.
; PLAN: r0=297(x), r1=34(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 34
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

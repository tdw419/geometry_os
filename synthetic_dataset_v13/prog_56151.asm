; DESCRIPTION: Draws a red circle centered at (61, 60) with radius 30.
; PLAN: r0=61(x), r1=60(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 60
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

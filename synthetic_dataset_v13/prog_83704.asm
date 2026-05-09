; DESCRIPTION: Draws a red circle centered at (423, 90) with radius 72.
; PLAN: r0=423(x), r1=90(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 90
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

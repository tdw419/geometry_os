; DESCRIPTION: Draws a red circle centered at (466, 153) with radius 10.
; PLAN: r0=466(x), r1=153(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 153
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

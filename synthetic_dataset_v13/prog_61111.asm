; DESCRIPTION: Draws a red circle centered at (60, 191) with radius 47.
; PLAN: r0=60(x), r1=191(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 191
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

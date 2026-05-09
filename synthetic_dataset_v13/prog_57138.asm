; DESCRIPTION: Draws a red circle centered at (356, 71) with radius 70.
; PLAN: r0=356(x), r1=71(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 71
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

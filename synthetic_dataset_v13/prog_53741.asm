; DESCRIPTION: Draws a red circle centered at (77, 60) with radius 12.
; PLAN: r0=77(x), r1=60(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 60
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

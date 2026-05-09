; DESCRIPTION: Draws a red circle centered at (251, 170) with radius 74.
; PLAN: r0=251(x), r1=170(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 170
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

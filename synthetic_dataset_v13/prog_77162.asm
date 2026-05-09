; DESCRIPTION: Draws a red circle centered at (427, 170) with radius 57.
; PLAN: r0=427(x), r1=170(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 170
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

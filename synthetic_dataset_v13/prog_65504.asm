; DESCRIPTION: Draws a red circle centered at (323, 176) with radius 60.
; PLAN: r0=323(x), r1=176(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 176
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

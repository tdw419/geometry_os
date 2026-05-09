; DESCRIPTION: Draws a red circle centered at (323, 62) with radius 16.
; PLAN: r0=323(x), r1=62(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 62
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

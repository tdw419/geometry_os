; DESCRIPTION: Draws a red circle centered at (418, 109) with radius 62.
; PLAN: r0=418(x), r1=109(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 109
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

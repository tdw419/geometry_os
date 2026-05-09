; DESCRIPTION: Draws a red circle centered at (364, 36) with radius 12.
; PLAN: r0=364(x), r1=36(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 36
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

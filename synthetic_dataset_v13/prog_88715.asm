; DESCRIPTION: Draws a red circle centered at (236, 83) with radius 78.
; PLAN: r0=236(x), r1=83(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 83
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

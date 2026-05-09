; DESCRIPTION: Draws a red circle centered at (384, 137) with radius 78.
; PLAN: r0=384(x), r1=137(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 137
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

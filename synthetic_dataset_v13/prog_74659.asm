; DESCRIPTION: Draws a red circle centered at (137, 67) with radius 26.
; PLAN: r0=137(x), r1=67(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 67
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

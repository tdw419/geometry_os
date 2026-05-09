; DESCRIPTION: Draws a red circle centered at (69, 156) with radius 58.
; PLAN: r0=69(x), r1=156(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 156
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

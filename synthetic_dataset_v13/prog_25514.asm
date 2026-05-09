; DESCRIPTION: Draws a red circle centered at (324, 114) with radius 44.
; PLAN: r0=324(x), r1=114(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 114
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

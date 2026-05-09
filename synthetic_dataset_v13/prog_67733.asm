; DESCRIPTION: Draws a red circle centered at (36, 114) with radius 13.
; PLAN: r0=36(x), r1=114(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 114
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

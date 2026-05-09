; DESCRIPTION: Draws a yellow circle centered at (342, 114) with radius 78.
; PLAN: r0=342(x), r1=114(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 114
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

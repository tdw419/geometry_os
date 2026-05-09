; DESCRIPTION: Draws a red circle centered at (165, 114) with radius 48.
; PLAN: r0=165(x), r1=114(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 114
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

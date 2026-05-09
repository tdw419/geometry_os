; DESCRIPTION: Draws a red circle centered at (267, 88) with radius 57.
; PLAN: r0=267(x), r1=88(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 88
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

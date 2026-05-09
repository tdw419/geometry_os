; DESCRIPTION: Draws a red circle centered at (113, 91) with radius 66.
; PLAN: r0=113(x), r1=91(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 91
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

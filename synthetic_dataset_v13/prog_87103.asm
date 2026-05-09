; DESCRIPTION: Draws a red circle centered at (106, 156) with radius 46.
; PLAN: r0=106(x), r1=156(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 156
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

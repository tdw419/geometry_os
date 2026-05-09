; DESCRIPTION: Draws a red circle centered at (81, 178) with radius 43.
; PLAN: r0=81(x), r1=178(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 178
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

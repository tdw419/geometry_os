; DESCRIPTION: Draws a red circle centered at (141, 97) with radius 56.
; PLAN: r0=141(x), r1=97(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 97
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

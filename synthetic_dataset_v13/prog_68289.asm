; DESCRIPTION: Draws a red circle centered at (182, 145) with radius 47.
; PLAN: r0=182(x), r1=145(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 145
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

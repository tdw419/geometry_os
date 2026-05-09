; DESCRIPTION: Draws a red circle centered at (180, 81) with radius 78.
; PLAN: r0=180(x), r1=81(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 81
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

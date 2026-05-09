; DESCRIPTION: Draws a red circle centered at (75, 77) with radius 74.
; PLAN: r0=75(x), r1=77(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 77
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

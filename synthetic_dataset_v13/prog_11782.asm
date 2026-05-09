; DESCRIPTION: Draws a red circle centered at (105, 150) with radius 75.
; PLAN: r0=105(x), r1=150(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

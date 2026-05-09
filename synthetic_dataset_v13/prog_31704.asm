; DESCRIPTION: Draws a red circle centered at (84, 90) with radius 52.
; PLAN: r0=84(x), r1=90(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 90
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

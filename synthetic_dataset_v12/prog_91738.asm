; DESCRIPTION: Draws a red circle centered at (72, 74) with radius 66.
; PLAN: r0=72(x), r1=74(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 74
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

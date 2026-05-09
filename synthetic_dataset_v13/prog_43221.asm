; DESCRIPTION: Draws a red circle centered at (279, 60) with radius 10.
; PLAN: r0=279(x), r1=60(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 60
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

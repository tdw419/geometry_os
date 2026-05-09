; DESCRIPTION: Draws a red circle centered at (448, 64) with radius 35.
; PLAN: r0=448(x), r1=64(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 64
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

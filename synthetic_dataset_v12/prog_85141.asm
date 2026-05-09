; DESCRIPTION: Draws a red circle centered at (84, 73) with radius 17.
; PLAN: r0=84(x), r1=73(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 73
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

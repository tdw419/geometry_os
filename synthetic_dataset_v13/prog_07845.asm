; DESCRIPTION: Draws a red circle centered at (282, 175) with radius 28.
; PLAN: r0=282(x), r1=175(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 175
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

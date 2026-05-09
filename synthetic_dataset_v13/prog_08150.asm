; DESCRIPTION: Draws a red circle centered at (240, 65) with radius 30.
; PLAN: r0=240(x), r1=65(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 65
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

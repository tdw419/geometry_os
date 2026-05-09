; DESCRIPTION: Draws a red circle centered at (166, 110) with radius 59.
; PLAN: r0=166(x), r1=110(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 110
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

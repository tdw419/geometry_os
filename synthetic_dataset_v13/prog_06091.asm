; DESCRIPTION: Draws a red circle centered at (158, 163) with radius 59.
; PLAN: r0=158(x), r1=163(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 163
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

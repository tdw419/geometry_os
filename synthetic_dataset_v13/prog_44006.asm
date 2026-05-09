; DESCRIPTION: Draws a red circle centered at (349, 106) with radius 59.
; PLAN: r0=349(x), r1=106(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 106
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (266, 59) with radius 36.
; PLAN: r0=266(x), r1=59(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 59
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

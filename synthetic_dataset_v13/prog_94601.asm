; DESCRIPTION: Draws a red circle centered at (330, 68) with radius 56.
; PLAN: r0=330(x), r1=68(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 68
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

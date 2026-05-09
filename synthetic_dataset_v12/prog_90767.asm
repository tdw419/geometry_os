; DESCRIPTION: Draws a red circle centered at (304, 116) with radius 56.
; PLAN: r0=304(x), r1=116(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 116
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

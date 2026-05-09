; DESCRIPTION: Draws a red circle centered at (403, 109) with radius 78.
; PLAN: r0=403(x), r1=109(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 109
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

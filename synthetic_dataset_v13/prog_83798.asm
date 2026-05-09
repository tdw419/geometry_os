; DESCRIPTION: Draws a red circle centered at (403, 81) with radius 44.
; PLAN: r0=403(x), r1=81(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 81
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

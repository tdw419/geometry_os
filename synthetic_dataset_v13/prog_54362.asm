; DESCRIPTION: Draws a red circle centered at (186, 116) with radius 54.
; PLAN: r0=186(x), r1=116(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 116
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (261, 120) with radius 68.
; PLAN: r0=261(x), r1=120(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 120
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

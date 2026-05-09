; DESCRIPTION: Draws a red circle centered at (261, 54) with radius 35.
; PLAN: r0=261(x), r1=54(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 54
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

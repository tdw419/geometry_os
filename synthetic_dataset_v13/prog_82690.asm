; DESCRIPTION: Draws a red circle centered at (49, 229) with radius 20.
; PLAN: r0=49(x), r1=229(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 229
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

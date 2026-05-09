; DESCRIPTION: Draws a red circle centered at (395, 101) with radius 20.
; PLAN: r0=395(x), r1=101(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 101
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

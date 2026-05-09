; DESCRIPTION: Draws a red circle centered at (314, 149) with radius 18.
; PLAN: r0=314(x), r1=149(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 149
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

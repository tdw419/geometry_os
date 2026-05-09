; DESCRIPTION: Draws a red circle centered at (363, 198) with radius 49.
; PLAN: r0=363(x), r1=198(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 198
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (198, 153) with radius 37.
; PLAN: r0=198(x), r1=153(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 153
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

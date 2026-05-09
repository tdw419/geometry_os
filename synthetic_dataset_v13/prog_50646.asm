; DESCRIPTION: Draws a red circle centered at (152, 153) with radius 19.
; PLAN: r0=152(x), r1=153(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 153
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (161, 148) with radius 56.
; PLAN: r0=161(x), r1=148(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 148
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (311, 154) with radius 53.
; PLAN: r0=311(x), r1=154(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 154
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

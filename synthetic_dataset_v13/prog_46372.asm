; DESCRIPTION: Draws a red circle centered at (268, 131) with radius 38.
; PLAN: r0=268(x), r1=131(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 131
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

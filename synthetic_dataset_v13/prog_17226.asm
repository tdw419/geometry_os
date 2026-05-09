; DESCRIPTION: Draws a red circle centered at (214, 81) with radius 31.
; PLAN: r0=214(x), r1=81(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 81
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

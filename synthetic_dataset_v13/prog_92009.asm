; DESCRIPTION: Draws a red circle centered at (273, 138) with radius 77.
; PLAN: r0=273(x), r1=138(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 138
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

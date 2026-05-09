; DESCRIPTION: Draws a red circle centered at (290, 76) with radius 71.
; PLAN: r0=290(x), r1=76(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 76
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

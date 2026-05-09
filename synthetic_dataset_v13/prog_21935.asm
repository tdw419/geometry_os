; DESCRIPTION: Draws a red circle centered at (370, 92) with radius 65.
; PLAN: r0=370(x), r1=92(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 92
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

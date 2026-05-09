; DESCRIPTION: Draws a red circle centered at (96, 193) with radius 47.
; PLAN: r0=96(x), r1=193(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 193
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

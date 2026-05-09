; DESCRIPTION: Draws a red circle centered at (104, 193) with radius 15.
; PLAN: r0=104(x), r1=193(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 193
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

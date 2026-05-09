; DESCRIPTION: Draws a red circle centered at (112, 230) with radius 12.
; PLAN: r0=112(x), r1=230(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 230
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

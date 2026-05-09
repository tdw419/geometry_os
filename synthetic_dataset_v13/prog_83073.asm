; DESCRIPTION: Draws a red circle centered at (273, 230) with radius 24.
; PLAN: r0=273(x), r1=230(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 230
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

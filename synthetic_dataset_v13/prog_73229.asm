; DESCRIPTION: Draws a red circle centered at (14, 186) with radius 14.
; PLAN: r0=14(x), r1=186(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 186
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

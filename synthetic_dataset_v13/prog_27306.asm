; DESCRIPTION: Draws a red circle centered at (273, 215) with radius 19.
; PLAN: r0=273(x), r1=215(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 215
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

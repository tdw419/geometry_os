; DESCRIPTION: Composite: Sets a single magenta pixel at (252, 200) then Draws a yellow circle centered at (452, 206) with radius 47.
; PLAN: r0=252(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=206(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 206
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

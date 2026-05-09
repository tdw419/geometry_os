; DESCRIPTION: Composite: Draws a magenta circle centered at (308, 123) with radius 72 then Sets a single red pixel at (210, 155).
; PLAN: r0=308(x), r1=123(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=155(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 123
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 155
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

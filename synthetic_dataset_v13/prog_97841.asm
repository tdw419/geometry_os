; DESCRIPTION: Composite: Draws a purple circle centered at (369, 166) with radius 78 then Sets a single red pixel at (304, 198).
; PLAN: r0=369(x), r1=166(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=198(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 166
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 198
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

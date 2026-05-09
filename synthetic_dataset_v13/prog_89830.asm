; DESCRIPTION: Composite: Draws a blue circle centered at (324, 126) with radius 71 then Sets a single red pixel at (58, 54).
; PLAN: r0=324(x), r1=126(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=54(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 126
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 54
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

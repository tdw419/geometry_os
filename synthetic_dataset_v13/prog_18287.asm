; DESCRIPTION: Composite: Sets a single yellow pixel at (373, 24) then Draws a purple circle centered at (363, 55) with radius 45 then Draws a red rectangle at (292, 155) with width 61 and height 62.
; PLAN: r0=373(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=55(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=155(y), r12=61(width), r13=62(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 363
LDI r6, 55
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 155
LDI r12, 61
LDI r13, 62
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

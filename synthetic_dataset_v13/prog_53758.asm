; DESCRIPTION: Composite: Draws a red rectangle at (225, 4) with width 27 and height 65 then Sets a single orange pixel at (184, 192) then Renders a purple disk with center (378, 109) and radius 58.
; PLAN: r0=225(x), r1=4(y), r2=27(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=192(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=109(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 4
LDI r2, 27
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 192
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 378
LDI r11, 109
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

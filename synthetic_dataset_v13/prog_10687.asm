; DESCRIPTION: Composite: Sets a single orange pixel at (361, 62) then Draws a yellow rectangle at (126, 11) with width 14 and height 105 then Renders a purple disk with center (483, 74) and radius 28.
; PLAN: r0=361(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=11(y), r7=14(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=483(x), r11=74(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 361
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 126
LDI r6, 11
LDI r7, 14
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 74
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

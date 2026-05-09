; DESCRIPTION: Composite: Renders a orange line between points (93, 111) and (428, 198) then Sets a single cyan pixel at (355, 211) then Draws a black rectangle at (248, 48) with width 95 and height 90.
; PLAN: r0=93(x1), r1=111(y1), r2=428(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=211(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=48(y), r12=95(width), r13=90(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 111
LDI r2, 428
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 211
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 48
LDI r12, 95
LDI r13, 90
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

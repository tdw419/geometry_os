; DESCRIPTION: Composite: Draws a black line from (486, 251) to (432, 167) then Places a purple 48x61 rectangle at position (457, 147) then Places a orange dot at position (175, 176).
; PLAN: r0=486(x1), r1=251(y1), r2=432(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=147(y), r7=48(width), r8=61(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=176(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 251
LDI r2, 432
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 147
LDI r7, 48
LDI r8, 61
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 176
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

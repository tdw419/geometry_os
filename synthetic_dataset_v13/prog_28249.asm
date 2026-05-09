; DESCRIPTION: Composite: Draws a green rectangle at (76, 83) with width 92 and height 76 then Places a red line segment connecting (147, 145) to (417, 237) then Sets a single cyan pixel at (175, 61).
; PLAN: r0=76(x), r1=83(y), r2=92(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x1), r6=145(y1), r7=417(x2), r8=237(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=61(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 83
LDI r2, 92
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 145
LDI r7, 417
LDI r8, 237
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 61
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

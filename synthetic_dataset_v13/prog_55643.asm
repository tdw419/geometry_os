; DESCRIPTION: Composite: Draws a black rectangle at (302, 127) with width 107 and height 78 then Places a black line segment connecting (278, 83) to (465, 45) then Sets a single black pixel at (119, 139).
; PLAN: r0=302(x), r1=127(y), r2=107(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=83(y1), r7=465(x2), r8=45(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=139(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 127
LDI r2, 107
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 83
LDI r7, 465
LDI r8, 45
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 139
LDI r12, 0x000000
PSET r10, r11, r12
HALT

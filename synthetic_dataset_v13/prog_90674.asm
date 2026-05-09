; DESCRIPTION: Composite: Places a white dot at position (378, 243) then Places a yellow line segment connecting (301, 211) to (127, 38) then Draws a green rectangle at (51, 122) with width 11 and height 110.
; PLAN: r0=378(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=301(x1), r6=211(y1), r7=127(x2), r8=38(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=122(y), r12=11(width), r13=110(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 211
LDI r7, 127
LDI r8, 38
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 122
LDI r12, 11
LDI r13, 110
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

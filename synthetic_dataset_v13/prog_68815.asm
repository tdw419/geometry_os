; DESCRIPTION: Composite: Sets a single cyan pixel at (378, 110) then Draws a green line from (469, 119) to (98, 56) then Draws a green rectangle at (252, 188) with width 59 and height 63.
; PLAN: r0=378(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=469(x1), r6=119(y1), r7=98(x2), r8=56(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=188(y), r12=59(width), r13=63(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 119
LDI r7, 98
LDI r8, 56
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 188
LDI r12, 59
LDI r13, 63
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

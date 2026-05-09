; DESCRIPTION: Composite: Places a magenta dot at position (366, 160) then Places a cyan line segment connecting (222, 160) to (222, 82) then Draws a cyan rectangle at (323, 11) with width 31 and height 41.
; PLAN: r0=366(x), r1=160(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=222(x1), r6=160(y1), r7=222(x2), r8=82(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=11(y), r12=31(width), r13=41(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 160
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 160
LDI r7, 222
LDI r8, 82
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 11
LDI r12, 31
LDI r13, 41
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

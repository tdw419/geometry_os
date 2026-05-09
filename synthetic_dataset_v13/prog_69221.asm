; DESCRIPTION: Composite: Draws a cyan line from (155, 53) to (17, 91) then Draws a cyan rectangle at (229, 104) with width 87 and height 85.
; PLAN: r0=155(x1), r1=53(y1), r2=17(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=104(y), r7=87(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 53
LDI r2, 17
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 104
LDI r7, 87
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Sets a single cyan pixel at (511, 145) then Draws a yellow line from (9, 208) to (217, 123) then Draws a orange rectangle at (99, 78) with width 30 and height 97.
; PLAN: r0=511(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=9(x1), r6=208(y1), r7=217(x2), r8=123(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=78(y), r12=30(width), r13=97(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 511
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 9
LDI r6, 208
LDI r7, 217
LDI r8, 123
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 78
LDI r12, 30
LDI r13, 97
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a orange line segment connecting (144, 186) to (313, 167) then Draws a cyan rectangle at (330, 153) with width 32 and height 21 then Sets a single orange pixel at (23, 212).
; PLAN: r0=144(x1), r1=186(y1), r2=313(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=153(y), r7=32(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=23(x), r11=212(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 186
LDI r2, 313
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 153
LDI r7, 32
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 212
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

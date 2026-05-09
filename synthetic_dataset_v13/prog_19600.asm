; DESCRIPTION: Composite: Draws a orange line from (247, 224) to (295, 208) then Creates a orange rectangular region at (248, 226) spanning 23 by 25 pixels then Places a green dot at position (38, 188).
; PLAN: r0=247(x1), r1=224(y1), r2=295(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=226(y), r7=23(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x), r11=188(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 224
LDI r2, 295
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 226
LDI r7, 23
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 188
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

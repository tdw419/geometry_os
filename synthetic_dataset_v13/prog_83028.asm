; DESCRIPTION: Composite: Draws a green line from (391, 44) to (47, 217) then Creates a orange rectangular region at (295, 9) spanning 33 by 107 pixels then Places a orange dot at position (238, 123).
; PLAN: r0=391(x1), r1=44(y1), r2=47(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=9(y), r7=33(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=123(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 44
LDI r2, 47
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 9
LDI r7, 33
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 123
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

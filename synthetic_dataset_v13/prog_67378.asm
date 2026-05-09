; DESCRIPTION: Composite: Draws a green line from (60, 26) to (446, 126) then Creates a orange rectangular region at (187, 39) spanning 104 by 75 pixels then Sets a single green pixel at (292, 78).
; PLAN: r0=60(x1), r1=26(y1), r2=446(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=39(y), r7=104(width), r8=75(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x), r11=78(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 26
LDI r2, 446
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 39
LDI r7, 104
LDI r8, 75
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 78
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

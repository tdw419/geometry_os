; DESCRIPTION: Composite: Draws a green line from (455, 74) to (479, 190) then Creates a green rectangular region at (252, 96) spanning 115 by 66 pixels then Sets a single red pixel at (134, 236).
; PLAN: r0=455(x1), r1=74(y1), r2=479(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=96(y), r7=115(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=236(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 455
LDI r1, 74
LDI r2, 479
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 96
LDI r7, 115
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 236
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

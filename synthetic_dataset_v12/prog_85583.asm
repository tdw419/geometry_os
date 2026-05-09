; DESCRIPTION: Composite: Draws a cyan line from (116, 222) to (11, 230) then Creates a cyan rectangular region at (146, 118) spanning 59 by 82 pixels then Sets a single purple pixel at (455, 36).
; PLAN: r0=116(x1), r1=222(y1), r2=11(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=118(y), r7=59(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=36(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 222
LDI r2, 11
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 118
LDI r7, 59
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 36
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

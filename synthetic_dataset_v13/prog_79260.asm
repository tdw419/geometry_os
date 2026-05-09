; DESCRIPTION: Composite: Creates a magenta rectangular region at (363, 189) spanning 116 by 66 pixels then Places a cyan line segment connecting (91, 231) to (313, 178) then Sets a single yellow pixel at (314, 16).
; PLAN: r0=363(x), r1=189(y), r2=116(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x1), r6=231(y1), r7=313(x2), r8=178(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=16(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 189
LDI r2, 116
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 231
LDI r7, 313
LDI r8, 178
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 16
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

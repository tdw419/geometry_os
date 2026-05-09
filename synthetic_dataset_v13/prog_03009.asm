; DESCRIPTION: Composite: Places a cyan line segment connecting (384, 229) to (86, 94) then Creates a purple rectangular region at (328, 117) spanning 114 by 49 pixels then Sets a single yellow pixel at (90, 207).
; PLAN: r0=384(x1), r1=229(y1), r2=86(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=117(y), r7=114(width), r8=49(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x), r11=207(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 229
LDI r2, 86
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 117
LDI r7, 114
LDI r8, 49
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 207
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Places a green 91x31 rectangle at position (31, 212) then Sets a single red pixel at (407, 81) then Places a white line segment connecting (97, 187) to (13, 106).
; PLAN: r0=31(x), r1=212(y), r2=91(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=81(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=97(x1), r11=187(y1), r12=13(x2), r13=106(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 212
LDI r2, 91
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 81
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 97
LDI r11, 187
LDI r12, 13
LDI r13, 106
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

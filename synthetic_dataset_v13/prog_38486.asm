; DESCRIPTION: Composite: Places a purple 18x114 rectangle at position (193, 83) then Places a green line segment connecting (358, 158) to (207, 168) then Places a green dot at position (323, 212).
; PLAN: r0=193(x), r1=83(y), r2=18(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x1), r6=158(y1), r7=207(x2), r8=168(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=212(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 83
LDI r2, 18
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 158
LDI r7, 207
LDI r8, 168
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 212
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

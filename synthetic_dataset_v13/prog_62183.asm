; DESCRIPTION: Composite: Places a cyan 84x119 rectangle at position (253, 70) then Draws a red line from (490, 126) to (411, 86).
; PLAN: r0=253(x), r1=70(y), r2=84(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x1), r6=126(y1), r7=411(x2), r8=86(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 70
LDI r2, 84
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 126
LDI r7, 411
LDI r8, 86
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

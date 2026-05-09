; DESCRIPTION: Composite: Places a blue 62x26 rectangle at position (13, 187) then Places a purple line segment connecting (484, 21) to (195, 188).
; PLAN: r0=13(x), r1=187(y), r2=62(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x1), r6=21(y1), r7=195(x2), r8=188(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 187
LDI r2, 62
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 21
LDI r7, 195
LDI r8, 188
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

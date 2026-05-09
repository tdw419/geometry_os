; DESCRIPTION: Composite: Places a white line segment connecting (137, 198) to (189, 106) then Places a green 37x108 rectangle at position (231, 118).
; PLAN: r0=137(x1), r1=198(y1), r2=189(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=118(y), r7=37(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 198
LDI r2, 189
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 118
LDI r7, 37
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

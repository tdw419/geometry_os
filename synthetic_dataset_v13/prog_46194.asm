; DESCRIPTION: Composite: Places a red 34x97 rectangle at position (208, 139) then Draws a red line from (281, 3) to (327, 154) then Draws a green circle centered at (353, 192) with radius 61.
; PLAN: r0=208(x), r1=139(y), r2=34(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=3(y1), r7=327(x2), r8=154(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=192(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 139
LDI r2, 34
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 3
LDI r7, 327
LDI r8, 154
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 192
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

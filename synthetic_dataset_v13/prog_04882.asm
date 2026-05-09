; DESCRIPTION: Composite: Draws a white rectangle at (127, 159) with width 94 and height 56 then Draws a green line from (16, 99) to (328, 203).
; PLAN: r0=127(x), r1=159(y), r2=94(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=99(y1), r7=328(x2), r8=203(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 159
LDI r2, 94
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 99
LDI r7, 328
LDI r8, 203
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Draws a green rectangle at (426, 128) with width 57 and height 54 then Draws a yellow line from (281, 110) to (203, 76).
; PLAN: r0=426(x), r1=128(y), r2=57(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=110(y1), r7=203(x2), r8=76(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 128
LDI r2, 57
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 110
LDI r7, 203
LDI r8, 76
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

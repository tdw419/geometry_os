; DESCRIPTION: Composite: Draws a green rectangle at (364, 172) with width 87 and height 14 then Draws a green line from (283, 54) to (153, 61).
; PLAN: r0=364(x), r1=172(y), r2=87(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=54(y1), r7=153(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 172
LDI r2, 87
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 54
LDI r7, 153
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

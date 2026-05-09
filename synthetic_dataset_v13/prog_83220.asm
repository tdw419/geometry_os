; DESCRIPTION: Composite: Draws a yellow rectangle at (248, 128) with width 113 and height 56 then Draws a purple line from (2, 58) to (176, 178).
; PLAN: r0=248(x), r1=128(y), r2=113(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=58(y1), r7=176(x2), r8=178(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 128
LDI r2, 113
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 58
LDI r7, 176
LDI r8, 178
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

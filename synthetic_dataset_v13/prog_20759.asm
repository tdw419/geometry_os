; DESCRIPTION: Composite: Draws a yellow line from (307, 143) to (162, 116) then Draws a green rectangle at (412, 200) with width 78 and height 19.
; PLAN: r0=307(x1), r1=143(y1), r2=162(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=200(y), r7=78(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 143
LDI r2, 162
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 200
LDI r7, 78
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

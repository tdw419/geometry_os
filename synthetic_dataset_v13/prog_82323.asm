; DESCRIPTION: Composite: Draws a yellow line from (288, 178) to (21, 153) then Draws a magenta rectangle at (139, 218) with width 29 and height 26.
; PLAN: r0=288(x1), r1=178(y1), r2=21(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=218(y), r7=29(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 178
LDI r2, 21
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 218
LDI r7, 29
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Draws a black rectangle at (7, 61) with width 110 and height 68 then Draws a yellow line from (113, 62) to (350, 16).
; PLAN: r0=7(x), r1=61(y), r2=110(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x1), r6=62(y1), r7=350(x2), r8=16(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 61
LDI r2, 110
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 62
LDI r7, 350
LDI r8, 16
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

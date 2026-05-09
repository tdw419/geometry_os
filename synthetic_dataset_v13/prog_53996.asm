; DESCRIPTION: Composite: Draws a yellow line from (126, 194) to (381, 244) then Draws a blue rectangle at (24, 99) with width 52 and height 68.
; PLAN: r0=126(x1), r1=194(y1), r2=381(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=99(y), r7=52(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 194
LDI r2, 381
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 99
LDI r7, 52
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

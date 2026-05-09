; DESCRIPTION: Composite: Draws a magenta rectangle at (191, 78) with width 16 and height 61 then Places a black line segment connecting (195, 145) to (324, 97).
; PLAN: r0=191(x), r1=78(y), r2=16(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=145(y1), r7=324(x2), r8=97(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 78
LDI r2, 16
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 145
LDI r7, 324
LDI r8, 97
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

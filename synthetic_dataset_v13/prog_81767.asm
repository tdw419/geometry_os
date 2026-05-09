; DESCRIPTION: Composite: Draws a blue rectangle at (207, 66) with width 119 and height 49 then Draws a yellow line from (439, 76) to (185, 228).
; PLAN: r0=207(x), r1=66(y), r2=119(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=76(y1), r7=185(x2), r8=228(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 66
LDI r2, 119
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 76
LDI r7, 185
LDI r8, 228
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

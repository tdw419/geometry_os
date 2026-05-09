; DESCRIPTION: Composite: Places a black line segment connecting (231, 226) to (1, 174) then Draws a yellow rectangle at (178, 78) with width 35 and height 97.
; PLAN: r0=231(x1), r1=226(y1), r2=1(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=78(y), r7=35(width), r8=97(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 226
LDI r2, 1
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 78
LDI r7, 35
LDI r8, 97
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT

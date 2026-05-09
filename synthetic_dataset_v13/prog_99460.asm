; DESCRIPTION: Composite: Draws a purple line from (216, 144) to (331, 15) then Draws a blue rectangle at (94, 66) with width 91 and height 74.
; PLAN: r0=216(x1), r1=144(y1), r2=331(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=66(y), r7=91(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 144
LDI r2, 331
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 66
LDI r7, 91
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

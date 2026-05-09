; DESCRIPTION: Composite: Draws a white rectangle at (188, 57) with width 110 and height 67 then Places a green line segment connecting (194, 179) to (36, 50) then Sets a single blue pixel at (283, 178).
; PLAN: r0=188(x), r1=57(y), r2=110(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x1), r6=179(y1), r7=36(x2), r8=50(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=178(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 188
LDI r1, 57
LDI r2, 110
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 179
LDI r7, 36
LDI r8, 50
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 178
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

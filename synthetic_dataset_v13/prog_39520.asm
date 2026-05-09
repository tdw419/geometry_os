; DESCRIPTION: Composite: Draws a green rectangle at (147, 12) with width 60 and height 86 then Places a white line segment connecting (468, 226) to (176, 207).
; PLAN: r0=147(x), r1=12(y), r2=60(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=226(y1), r7=176(x2), r8=207(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 12
LDI r2, 60
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 226
LDI r7, 176
LDI r8, 207
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT

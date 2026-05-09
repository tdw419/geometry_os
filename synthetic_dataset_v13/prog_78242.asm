; DESCRIPTION: Composite: Places a purple line segment connecting (41, 231) to (347, 32) then Draws a purple rectangle at (319, 210) with width 63 and height 44.
; PLAN: r0=41(x1), r1=231(y1), r2=347(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=210(y), r7=63(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 231
LDI r2, 347
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 210
LDI r7, 63
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

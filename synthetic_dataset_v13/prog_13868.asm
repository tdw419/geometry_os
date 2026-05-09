; DESCRIPTION: Composite: Places a blue line segment connecting (296, 208) to (346, 80) then Draws a green rectangle at (205, 94) with width 79 and height 53.
; PLAN: r0=296(x1), r1=208(y1), r2=346(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=94(y), r7=79(width), r8=53(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 208
LDI r2, 346
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 94
LDI r7, 79
LDI r8, 53
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

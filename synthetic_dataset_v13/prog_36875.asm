; DESCRIPTION: Composite: Places a green line segment connecting (58, 89) to (417, 223) then Draws a green rectangle at (331, 104) with width 95 and height 64.
; PLAN: r0=58(x1), r1=89(y1), r2=417(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=104(y), r7=95(width), r8=64(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 89
LDI r2, 417
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 104
LDI r7, 95
LDI r8, 64
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

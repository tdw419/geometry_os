; DESCRIPTION: Composite: Places a black line segment connecting (314, 234) to (241, 143) then Draws a green rectangle at (393, 161) with width 30 and height 93.
; PLAN: r0=314(x1), r1=234(y1), r2=241(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=161(y), r7=30(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 234
LDI r2, 241
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 161
LDI r7, 30
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a green line segment connecting (93, 147) to (476, 90) then Draws a cyan rectangle at (65, 139) with width 110 and height 42.
; PLAN: r0=93(x1), r1=147(y1), r2=476(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=139(y), r7=110(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 147
LDI r2, 476
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 139
LDI r7, 110
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Draws a black line from (110, 2) to (93, 22) then Draws a red rectangle at (61, 24) with width 93 and height 58.
; PLAN: r0=110(x1), r1=2(y1), r2=93(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=24(y), r7=93(width), r8=58(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 2
LDI r2, 93
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 24
LDI r7, 93
LDI r8, 58
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

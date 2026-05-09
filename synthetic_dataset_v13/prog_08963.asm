; DESCRIPTION: Composite: Draws a green rectangle at (21, 158) with width 76 and height 40 then Draws a green line from (118, 64) to (148, 217).
; PLAN: r0=21(x), r1=158(y), r2=76(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=64(y1), r7=148(x2), r8=217(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 158
LDI r2, 76
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 64
LDI r7, 148
LDI r8, 217
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

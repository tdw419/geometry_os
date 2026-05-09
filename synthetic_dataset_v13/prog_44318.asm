; DESCRIPTION: Composite: Draws a yellow line from (328, 158) to (486, 240) then Draws a white rectangle at (336, 79) with width 19 and height 68.
; PLAN: r0=328(x1), r1=158(y1), r2=486(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=79(y), r7=19(width), r8=68(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 158
LDI r2, 486
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 79
LDI r7, 19
LDI r8, 68
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

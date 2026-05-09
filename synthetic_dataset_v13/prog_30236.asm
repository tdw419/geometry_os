; DESCRIPTION: Composite: Draws a cyan rectangle at (37, 136) with width 89 and height 68 then Places a magenta line segment connecting (217, 202) to (89, 88).
; PLAN: r0=37(x), r1=136(y), r2=89(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x1), r6=202(y1), r7=89(x2), r8=88(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 136
LDI r2, 89
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 202
LDI r7, 89
LDI r8, 88
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT

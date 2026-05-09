; DESCRIPTION: Composite: Draws a green rectangle at (212, 23) with width 54 and height 79 then Renders a cyan line between points (37, 16) and (432, 162).
; PLAN: r0=212(x), r1=23(y), r2=54(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=16(y1), r7=432(x2), r8=162(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 23
LDI r2, 54
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 16
LDI r7, 432
LDI r8, 162
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

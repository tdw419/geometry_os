; DESCRIPTION: Composite: Draws a blue rectangle at (12, 161) with width 22 and height 79 then Draws a yellow line from (156, 45) to (266, 175).
; PLAN: r0=12(x), r1=161(y), r2=22(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x1), r6=45(y1), r7=266(x2), r8=175(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 161
LDI r2, 22
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 45
LDI r7, 266
LDI r8, 175
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

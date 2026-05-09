; DESCRIPTION: Composite: Draws a magenta rectangle at (321, 71) with width 115 and height 66 then Draws a magenta line from (361, 26) to (110, 149).
; PLAN: r0=321(x), r1=71(y), r2=115(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x1), r6=26(y1), r7=110(x2), r8=149(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 71
LDI r2, 115
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 26
LDI r7, 110
LDI r8, 149
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT

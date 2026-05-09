; DESCRIPTION: Composite: Draws a purple rectangle at (211, 79) with width 115 and height 98 then Draws a purple line from (406, 187) to (225, 146).
; PLAN: r0=211(x), r1=79(y), r2=115(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=187(y1), r7=225(x2), r8=146(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 79
LDI r2, 115
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 187
LDI r7, 225
LDI r8, 146
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

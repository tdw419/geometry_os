; DESCRIPTION: Composite: Draws a green rectangle at (211, 137) with width 46 and height 44 then Draws a white line from (149, 185) to (272, 163).
; PLAN: r0=211(x), r1=137(y), r2=46(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=185(y1), r7=272(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 137
LDI r2, 46
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 185
LDI r7, 272
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT

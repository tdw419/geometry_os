; DESCRIPTION: Composite: Draws a green circle centered at (429, 147) with radius 70 then Draws a red line from (26, 194) to (364, 153).
; PLAN: r0=429(x), r1=147(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=194(y1), r7=364(x2), r8=153(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 147
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 194
LDI r7, 364
LDI r8, 153
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

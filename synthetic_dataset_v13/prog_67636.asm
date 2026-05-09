; DESCRIPTION: Composite: Draws a green circle centered at (144, 125) with radius 60 then Draws a red line from (227, 216) to (509, 185).
; PLAN: r0=144(x), r1=125(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=216(y1), r7=509(x2), r8=185(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 125
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 216
LDI r7, 509
LDI r8, 185
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

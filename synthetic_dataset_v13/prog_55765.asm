; DESCRIPTION: Composite: Creates a yellow circular shape at (143, 169) with radius 63 then Draws a yellow line from (334, 170) to (125, 232).
; PLAN: r0=143(x), r1=169(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=170(y1), r7=125(x2), r8=232(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 169
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 170
LDI r7, 125
LDI r8, 232
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

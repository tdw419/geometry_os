; DESCRIPTION: Composite: Draws a orange circle centered at (98, 106) with radius 74 then Draws a green line from (87, 246) to (326, 144).
; PLAN: r0=98(x), r1=106(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=246(y1), r7=326(x2), r8=144(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 106
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 246
LDI r7, 326
LDI r8, 144
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

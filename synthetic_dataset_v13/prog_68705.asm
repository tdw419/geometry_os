; DESCRIPTION: Composite: Creates a green circular shape at (129, 89) with radius 74 then Draws a orange line from (438, 106) to (228, 48).
; PLAN: r0=129(x), r1=89(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x1), r6=106(y1), r7=228(x2), r8=48(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 89
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 106
LDI r7, 228
LDI r8, 48
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

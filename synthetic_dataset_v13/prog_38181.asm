; DESCRIPTION: Composite: Creates a magenta circular shape at (391, 123) with radius 10 then Renders a orange line between points (393, 211) and (26, 205).
; PLAN: r0=391(x), r1=123(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x1), r6=211(y1), r7=26(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 123
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 211
LDI r7, 26
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

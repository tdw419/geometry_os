; DESCRIPTION: Composite: Creates a orange circular shape at (258, 150) with radius 66 then Renders a purple line between points (89, 199) and (138, 13).
; PLAN: r0=258(x), r1=150(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x1), r6=199(y1), r7=138(x2), r8=13(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 150
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 199
LDI r7, 138
LDI r8, 13
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

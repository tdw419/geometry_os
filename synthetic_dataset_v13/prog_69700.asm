; DESCRIPTION: Composite: Draws a yellow circle centered at (428, 78) with radius 36 then Renders a yellow line between points (166, 99) and (94, 176).
; PLAN: r0=428(x), r1=78(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=99(y1), r7=94(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 78
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 99
LDI r7, 94
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

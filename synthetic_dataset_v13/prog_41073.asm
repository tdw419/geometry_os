; DESCRIPTION: Composite: Draws a green circle centered at (293, 170) with radius 22 then Draws a orange line from (376, 218) to (312, 21).
; PLAN: r0=293(x), r1=170(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x1), r6=218(y1), r7=312(x2), r8=21(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 170
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 218
LDI r7, 312
LDI r8, 21
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Creates a white circular shape at (379, 100) with radius 74 then Places a orange line segment connecting (451, 62) to (316, 86).
; PLAN: r0=379(x), r1=100(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=62(y1), r7=316(x2), r8=86(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 100
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 62
LDI r7, 316
LDI r8, 86
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

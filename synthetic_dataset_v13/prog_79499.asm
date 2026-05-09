; DESCRIPTION: Composite: Places a orange circle of radius 40 at center (49, 124) then Places a orange line segment connecting (363, 236) to (381, 147).
; PLAN: r0=49(x), r1=124(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=236(y1), r7=381(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 124
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 236
LDI r7, 381
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

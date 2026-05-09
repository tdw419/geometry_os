; DESCRIPTION: Composite: Renders a orange line between points (363, 183) and (325, 75) then Renders a blue box of size 31x87 starting at (280, 100).
; PLAN: r0=363(x1), r1=183(y1), r2=325(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=100(y), r7=31(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 183
LDI r2, 325
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 100
LDI r7, 31
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a orange disk with center (365, 188) and radius 55 then Draws a orange line from (136, 30) to (427, 104).
; PLAN: r0=365(x), r1=188(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x1), r6=30(y1), r7=427(x2), r8=104(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 188
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 30
LDI r7, 427
LDI r8, 104
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

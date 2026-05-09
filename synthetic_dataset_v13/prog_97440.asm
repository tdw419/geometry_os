; DESCRIPTION: Composite: Draws a orange line from (203, 46) to (439, 245) then Renders a orange disk with center (272, 162) and radius 26.
; PLAN: r0=203(x1), r1=46(y1), r2=439(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=162(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 46
LDI r2, 439
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 162
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

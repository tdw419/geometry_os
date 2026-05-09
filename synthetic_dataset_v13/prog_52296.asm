; DESCRIPTION: Composite: Places a blue circle of radius 25 at center (236, 193) then Renders a orange line between points (348, 22) and (248, 45).
; PLAN: r0=236(x), r1=193(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=22(y1), r7=248(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 193
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 22
LDI r7, 248
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a orange disk with center (293, 187) and radius 30 then Places a orange line segment connecting (273, 55) to (101, 246).
; PLAN: r0=293(x), r1=187(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x1), r6=55(y1), r7=101(x2), r8=246(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 187
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 55
LDI r7, 101
LDI r8, 246
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

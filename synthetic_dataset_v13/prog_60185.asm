; DESCRIPTION: Composite: Renders a orange disk with center (141, 110) and radius 60 then Draws a white line from (508, 134) to (269, 89).
; PLAN: r0=141(x), r1=110(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x1), r6=134(y1), r7=269(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 110
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 134
LDI r7, 269
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT

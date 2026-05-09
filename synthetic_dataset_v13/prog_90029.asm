; DESCRIPTION: Composite: Renders a green line between points (132, 65) and (454, 185) then Sets a single orange pixel at (321, 68) then Places a white circle of radius 34 at center (443, 207).
; PLAN: r0=132(x1), r1=65(y1), r2=454(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=68(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=207(y), r12=34(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 65
LDI r2, 454
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 68
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 443
LDI r11, 207
LDI r12, 34
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

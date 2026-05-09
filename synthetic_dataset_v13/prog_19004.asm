; DESCRIPTION: Composite: Creates a orange circular shape at (290, 143) with radius 45 then Renders a orange line between points (467, 201) and (158, 84) then Places a purple dot at position (83, 55).
; PLAN: r0=290(x), r1=143(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x1), r6=201(y1), r7=158(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=55(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 143
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 201
LDI r7, 158
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 55
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

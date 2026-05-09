; DESCRIPTION: Composite: Renders a red line between points (470, 60) and (508, 156) then Creates a blue circular shape at (46, 126) with radius 30 then Places a black dot at position (261, 43).
; PLAN: r0=470(x1), r1=60(y1), r2=508(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=126(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=43(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 470
LDI r1, 60
LDI r2, 508
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 126
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 43
LDI r12, 0x000000
PSET r10, r11, r12
HALT

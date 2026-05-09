; DESCRIPTION: Composite: Places a blue line segment connecting (143, 52) to (442, 234) then Places a blue dot at position (466, 87) then Creates a cyan circular shape at (276, 100) with radius 26.
; PLAN: r0=143(x1), r1=52(y1), r2=442(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=87(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=276(x), r11=100(y), r12=26(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 52
LDI r2, 442
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 87
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 100
LDI r12, 26
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Renders a green box of size 50x58 starting at (93, 118) then Places a blue line segment connecting (2, 251) to (495, 251) then Places a yellow dot at position (359, 245).
; PLAN: r0=93(x), r1=118(y), r2=50(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=251(y1), r7=495(x2), r8=251(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=245(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 93
LDI r1, 118
LDI r2, 50
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 251
LDI r7, 495
LDI r8, 251
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 245
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

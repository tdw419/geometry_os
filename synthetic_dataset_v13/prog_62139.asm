; DESCRIPTION: Composite: Renders a green line between points (137, 30) and (4, 245) then Creates a orange rectangular region at (484, 91) spanning 27 by 101 pixels.
; PLAN: r0=137(x1), r1=30(y1), r2=4(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=91(y), r7=27(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 30
LDI r2, 4
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 91
LDI r7, 27
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

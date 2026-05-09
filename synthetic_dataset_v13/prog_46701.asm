; DESCRIPTION: Composite: Renders a purple box of size 20x77 starting at (212, 85) then Renders a purple line between points (275, 119) and (31, 187) then Renders a red disk with center (111, 52) and radius 49.
; PLAN: r0=212(x), r1=85(y), r2=20(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=119(y1), r7=31(x2), r8=187(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=52(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 85
LDI r2, 20
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 119
LDI r7, 31
LDI r8, 187
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 52
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

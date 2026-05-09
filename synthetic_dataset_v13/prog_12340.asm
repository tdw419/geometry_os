; DESCRIPTION: Composite: Draws a black line from (489, 151) to (510, 137) then Renders a black box of size 77x24 starting at (66, 56) then Sets a single black pixel at (58, 45).
; PLAN: r0=489(x1), r1=151(y1), r2=510(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=56(y), r7=77(width), r8=24(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x), r11=45(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 489
LDI r1, 151
LDI r2, 510
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 56
LDI r7, 77
LDI r8, 24
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 45
LDI r12, 0x000000
PSET r10, r11, r12
HALT

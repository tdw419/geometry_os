; DESCRIPTION: Composite: Sets a single black pixel at (126, 120) then Creates a black rectangular region at (174, 156) spanning 119 by 40 pixels then Renders a cyan line between points (364, 36) and (117, 176).
; PLAN: r0=126(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=156(y), r7=119(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x1), r11=36(y1), r12=117(x2), r13=176(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 174
LDI r6, 156
LDI r7, 119
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 36
LDI r12, 117
LDI r13, 176
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT

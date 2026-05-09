; DESCRIPTION: Composite: Creates a green rectangular region at (178, 38) spanning 41 by 14 pixels then Renders a yellow line between points (268, 167) and (405, 123) then Sets a single black pixel at (466, 175).
; PLAN: r0=178(x), r1=38(y), r2=41(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x1), r6=167(y1), r7=405(x2), r8=123(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=175(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 38
LDI r2, 41
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 167
LDI r7, 405
LDI r8, 123
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 175
LDI r12, 0x000000
PSET r10, r11, r12
HALT

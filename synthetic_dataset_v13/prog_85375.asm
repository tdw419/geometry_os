; DESCRIPTION: Composite: Creates a purple rectangular region at (152, 38) spanning 66 by 17 pixels then Renders a yellow line between points (280, 26) and (363, 103) then Sets a single black pixel at (316, 69).
; PLAN: r0=152(x), r1=38(y), r2=66(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=26(y1), r7=363(x2), r8=103(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=69(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 38
LDI r2, 66
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 26
LDI r7, 363
LDI r8, 103
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 69
LDI r12, 0x000000
PSET r10, r11, r12
HALT

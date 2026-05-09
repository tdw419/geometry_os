; DESCRIPTION: Composite: Sets a single orange pixel at (209, 4) then Creates a black rectangular region at (407, 141) spanning 75 by 37 pixels then Places a purple line segment connecting (498, 98) to (470, 34).
; PLAN: r0=209(x), r1=4(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=141(y), r7=75(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=498(x1), r11=98(y1), r12=470(x2), r13=34(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 4
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 407
LDI r6, 141
LDI r7, 75
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 98
LDI r12, 470
LDI r13, 34
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

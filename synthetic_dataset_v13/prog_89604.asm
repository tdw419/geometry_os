; DESCRIPTION: Composite: Creates a yellow rectangular region at (400, 91) spanning 20 by 27 pixels then Places a orange line segment connecting (362, 12) to (91, 172) then Places a black dot at position (364, 129).
; PLAN: r0=400(x), r1=91(y), r2=20(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=12(y1), r7=91(x2), r8=172(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=129(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 91
LDI r2, 20
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 12
LDI r7, 91
LDI r8, 172
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 129
LDI r12, 0x000000
PSET r10, r11, r12
HALT

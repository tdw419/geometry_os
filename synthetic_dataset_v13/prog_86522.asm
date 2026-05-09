; DESCRIPTION: Composite: Sets a single cyan pixel at (303, 54) then Creates a purple rectangular region at (310, 112) spanning 45 by 119 pixels then Places a black line segment connecting (334, 151) to (128, 181).
; PLAN: r0=303(x), r1=54(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=112(y), r7=45(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x1), r11=151(y1), r12=128(x2), r13=181(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 54
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 112
LDI r7, 45
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 151
LDI r12, 128
LDI r13, 181
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

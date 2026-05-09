; DESCRIPTION: Composite: Places a black dot at position (15, 127) then Creates a yellow rectangular region at (31, 151) spanning 85 by 53 pixels then Places a purple line segment connecting (195, 72) to (413, 236).
; PLAN: r0=15(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=151(y), r7=85(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x1), r11=72(y1), r12=413(x2), r13=236(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 31
LDI r6, 151
LDI r7, 85
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 72
LDI r12, 413
LDI r13, 236
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

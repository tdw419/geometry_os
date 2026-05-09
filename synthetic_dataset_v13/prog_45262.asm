; DESCRIPTION: Composite: Renders a purple disk with center (378, 109) and radius 58 then Creates a purple rectangular region at (116, 37) spanning 26 by 99 pixels then Places a red dot at position (336, 207).
; PLAN: r0=378(x), r1=109(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=37(y), r7=26(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x), r11=207(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 109
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 37
LDI r7, 26
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 207
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

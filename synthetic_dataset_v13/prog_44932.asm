; DESCRIPTION: Composite: Places a purple dot at position (430, 253) then Creates a purple rectangular region at (203, 82) spanning 57 by 76 pixels then Renders a black line between points (17, 108) and (162, 12).
; PLAN: r0=430(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=82(y), r7=57(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=17(x1), r11=108(y1), r12=162(x2), r13=12(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 82
LDI r7, 57
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 108
LDI r12, 162
LDI r13, 12
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

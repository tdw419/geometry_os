; DESCRIPTION: Composite: Creates a red rectangular region at (41, 15) spanning 56 by 82 pixels then Places a purple dot at position (303, 153) then Places a red line segment connecting (287, 255) to (131, 142).
; PLAN: r0=41(x), r1=15(y), r2=56(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=287(x1), r11=255(y1), r12=131(x2), r13=142(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 15
LDI r2, 56
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 287
LDI r11, 255
LDI r12, 131
LDI r13, 142
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

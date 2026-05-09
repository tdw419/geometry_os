; DESCRIPTION: Composite: Creates a blue rectangular region at (76, 114) spanning 101 by 98 pixels then Places a red dot at position (446, 118) then Renders a purple line between points (452, 182) and (178, 173).
; PLAN: r0=76(x), r1=114(y), r2=101(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=118(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=452(x1), r11=182(y1), r12=178(x2), r13=173(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 114
LDI r2, 101
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 118
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 452
LDI r11, 182
LDI r12, 178
LDI r13, 173
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

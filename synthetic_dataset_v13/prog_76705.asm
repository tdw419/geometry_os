; DESCRIPTION: Composite: Creates a blue rectangular region at (7, 101) spanning 92 by 43 pixels then Sets a single red pixel at (445, 131) then Renders a purple line between points (161, 192) and (153, 96).
; PLAN: r0=7(x), r1=101(y), r2=92(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=131(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=161(x1), r11=192(y1), r12=153(x2), r13=96(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 101
LDI r2, 92
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 131
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 161
LDI r11, 192
LDI r12, 153
LDI r13, 96
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

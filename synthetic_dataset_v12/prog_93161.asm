; DESCRIPTION: Composite: Creates a purple rectangular region at (118, 127) spanning 72 by 106 pixels then Sets a single white pixel at (238, 96) then Renders a purple line between points (488, 198) and (149, 2).
; PLAN: r0=118(x), r1=127(y), r2=72(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=488(x1), r11=198(y1), r12=149(x2), r13=2(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 127
LDI r2, 72
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 488
LDI r11, 198
LDI r12, 149
LDI r13, 2
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

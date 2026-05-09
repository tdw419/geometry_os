; DESCRIPTION: Composite: Creates a black rectangular region at (262, 8) spanning 92 by 105 pixels then Sets a single magenta pixel at (474, 176) then Draws a blue line from (203, 14) to (317, 165).
; PLAN: r0=262(x), r1=8(y), r2=92(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=203(x1), r11=14(y1), r12=317(x2), r13=165(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 8
LDI r2, 92
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 14
LDI r12, 317
LDI r13, 165
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

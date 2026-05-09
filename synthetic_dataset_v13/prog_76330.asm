; DESCRIPTION: Composite: Places a orange line segment connecting (226, 249) to (221, 109) then Sets a single red pixel at (238, 87) then Places a magenta 66x17 rectangle at position (315, 59).
; PLAN: r0=226(x1), r1=249(y1), r2=221(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=59(y), r12=66(width), r13=17(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 249
LDI r2, 221
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 315
LDI r11, 59
LDI r12, 66
LDI r13, 17
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

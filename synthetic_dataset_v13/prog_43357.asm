; DESCRIPTION: Composite: Sets a single orange pixel at (382, 172) then Creates a black rectangular region at (368, 133) spanning 17 by 76 pixels then Draws a blue line from (371, 90) to (414, 39).
; PLAN: r0=382(x), r1=172(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=133(y), r7=17(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x1), r11=90(y1), r12=414(x2), r13=39(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 172
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 368
LDI r6, 133
LDI r7, 17
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 90
LDI r12, 414
LDI r13, 39
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Draws a blue line from (34, 46) to (11, 104) then Sets a single green pixel at (203, 129) then Creates a purple rectangular region at (11, 64) spanning 10 by 72 pixels.
; PLAN: r0=34(x1), r1=46(y1), r2=11(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=11(x), r11=64(y), r12=10(width), r13=72(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 46
LDI r2, 11
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 11
LDI r11, 64
LDI r12, 10
LDI r13, 72
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

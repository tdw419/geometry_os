; DESCRIPTION: Composite: Places a purple line segment connecting (295, 121) to (489, 57) then Places a blue dot at position (97, 92) then Places a purple 90x109 rectangle at position (372, 133).
; PLAN: r0=295(x1), r1=121(y1), r2=489(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=372(x), r11=133(y), r12=90(width), r13=109(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 121
LDI r2, 489
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 372
LDI r11, 133
LDI r12, 90
LDI r13, 109
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

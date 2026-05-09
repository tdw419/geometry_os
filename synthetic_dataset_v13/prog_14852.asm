; DESCRIPTION: Composite: Draws a purple line from (232, 191) to (148, 110) then Places a white dot at position (487, 35) then Draws a white rectangle at (55, 48) with width 97 and height 73.
; PLAN: r0=232(x1), r1=191(y1), r2=148(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=35(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=55(x), r11=48(y), r12=97(width), r13=73(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 191
LDI r2, 148
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 35
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 55
LDI r11, 48
LDI r12, 97
LDI r13, 73
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a purple line segment connecting (123, 175) to (255, 60) then Places a magenta dot at position (484, 71) then Creates a orange rectangular region at (58, 149) spanning 97 by 33 pixels.
; PLAN: r0=123(x1), r1=175(y1), r2=255(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=149(y), r12=97(width), r13=33(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 175
LDI r2, 255
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 149
LDI r12, 97
LDI r13, 33
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

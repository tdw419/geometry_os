; DESCRIPTION: Composite: Places a orange 74x36 rectangle at position (396, 6) then Sets a single black pixel at (504, 115) then Places a yellow line segment connecting (3, 122) to (472, 39).
; PLAN: r0=396(x), r1=6(y), r2=74(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=115(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=3(x1), r11=122(y1), r12=472(x2), r13=39(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 6
LDI r2, 74
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 115
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 3
LDI r11, 122
LDI r12, 472
LDI r13, 39
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

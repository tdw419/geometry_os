; DESCRIPTION: Composite: Draws a purple rectangle at (23, 60) with width 62 and height 83 then Sets a single yellow pixel at (297, 33) then Draws a orange line from (469, 184) to (490, 132).
; PLAN: r0=23(x), r1=60(y), r2=62(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=33(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=469(x1), r11=184(y1), r12=490(x2), r13=132(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 60
LDI r2, 62
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 33
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 469
LDI r11, 184
LDI r12, 490
LDI r13, 132
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

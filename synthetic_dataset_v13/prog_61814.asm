; DESCRIPTION: Composite: Places a black dot at position (377, 99) then Places a purple line segment connecting (214, 153) to (451, 43) then Places a orange 112x25 rectangle at position (263, 62).
; PLAN: r0=377(x), r1=99(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=214(x1), r6=153(y1), r7=451(x2), r8=43(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=62(y), r12=112(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 99
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 153
LDI r7, 451
LDI r8, 43
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 62
LDI r12, 112
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

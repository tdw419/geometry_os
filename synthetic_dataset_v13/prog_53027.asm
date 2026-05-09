; DESCRIPTION: Composite: Places a black dot at position (129, 76) then Draws a black rectangle at (17, 142) with width 110 and height 87 then Places a purple line segment connecting (304, 114) to (510, 218).
; PLAN: r0=129(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=142(y), r7=110(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x1), r11=114(y1), r12=510(x2), r13=218(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 17
LDI r6, 142
LDI r7, 110
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 114
LDI r12, 510
LDI r13, 218
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

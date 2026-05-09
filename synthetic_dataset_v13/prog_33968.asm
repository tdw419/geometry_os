; DESCRIPTION: Composite: Draws a orange line from (413, 162) to (102, 89) then Places a black dot at position (343, 239) then Draws a blue rectangle at (183, 48) with width 99 and height 116.
; PLAN: r0=413(x1), r1=162(y1), r2=102(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=239(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=48(y), r12=99(width), r13=116(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 162
LDI r2, 102
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 239
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 183
LDI r11, 48
LDI r12, 99
LDI r13, 116
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

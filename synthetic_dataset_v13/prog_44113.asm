; DESCRIPTION: Composite: Places a black dot at position (118, 6) then Draws a orange line from (341, 172) to (154, 137) then Places a magenta 118x67 rectangle at position (13, 77).
; PLAN: r0=118(x), r1=6(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=341(x1), r6=172(y1), r7=154(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=77(y), r12=118(width), r13=67(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 6
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 172
LDI r7, 154
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 77
LDI r12, 118
LDI r13, 67
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

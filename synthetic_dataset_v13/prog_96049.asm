; DESCRIPTION: Composite: Places a magenta dot at position (263, 45) then Renders a orange box of size 84x107 starting at (140, 18) then Draws a orange line from (378, 102) to (364, 80).
; PLAN: r0=263(x), r1=45(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=18(y), r7=84(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=102(y1), r12=364(x2), r13=80(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 45
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 18
LDI r7, 84
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 102
LDI r12, 364
LDI r13, 80
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

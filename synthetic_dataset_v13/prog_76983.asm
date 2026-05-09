; DESCRIPTION: Composite: Places a orange dot at position (66, 58) then Places a blue line segment connecting (445, 3) to (312, 185) then Renders a black box of size 105x44 starting at (167, 55).
; PLAN: r0=66(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=3(y1), r7=312(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=55(y), r12=105(width), r13=44(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 58
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 445
LDI r6, 3
LDI r7, 312
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 55
LDI r12, 105
LDI r13, 44
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

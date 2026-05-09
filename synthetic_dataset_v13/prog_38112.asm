; DESCRIPTION: Composite: Places a black dot at position (318, 26) then Places a black line segment connecting (478, 94) to (331, 42) then Renders a orange box of size 52x113 starting at (24, 56).
; PLAN: r0=318(x), r1=26(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=478(x1), r6=94(y1), r7=331(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=56(y), r12=52(width), r13=113(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 26
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 478
LDI r6, 94
LDI r7, 331
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 56
LDI r12, 52
LDI r13, 113
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

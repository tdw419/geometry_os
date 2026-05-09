; DESCRIPTION: Composite: Places a orange dot at position (73, 82) then Draws a orange rectangle at (205, 62) with width 107 and height 89 then Draws a black line from (326, 137) to (366, 201).
; PLAN: r0=73(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=62(y), r7=107(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x1), r11=137(y1), r12=366(x2), r13=201(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 205
LDI r6, 62
LDI r7, 107
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 137
LDI r12, 366
LDI r13, 201
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

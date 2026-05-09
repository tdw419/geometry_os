; DESCRIPTION: Composite: Sets a single cyan pixel at (442, 24) then Renders a purple box of size 41x103 starting at (411, 91) then Places a orange line segment connecting (408, 227) to (339, 25).
; PLAN: r0=442(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=91(y), r7=41(width), r8=103(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x1), r11=227(y1), r12=339(x2), r13=25(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 91
LDI r7, 41
LDI r8, 103
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 227
LDI r12, 339
LDI r13, 25
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

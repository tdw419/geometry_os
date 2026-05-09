; DESCRIPTION: Composite: Renders a yellow box of size 41x83 starting at (14, 100) then Draws a orange line from (130, 148) to (336, 202) then Sets a single black pixel at (457, 158).
; PLAN: r0=14(x), r1=100(y), r2=41(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=148(y1), r7=336(x2), r8=202(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=457(x), r11=158(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 100
LDI r2, 41
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 148
LDI r7, 336
LDI r8, 202
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 158
LDI r12, 0x000000
PSET r10, r11, r12
HALT

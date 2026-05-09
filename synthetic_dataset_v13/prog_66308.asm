; DESCRIPTION: Composite: Draws a black line from (461, 41) to (334, 52) then Sets a single orange pixel at (190, 119) then Renders a blue box of size 39x80 starting at (430, 62).
; PLAN: r0=461(x1), r1=41(y1), r2=334(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=119(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=62(y), r12=39(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 41
LDI r2, 334
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 119
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 430
LDI r11, 62
LDI r12, 39
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

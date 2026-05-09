; DESCRIPTION: Composite: Renders a orange line between points (331, 43) and (169, 41) then Places a black 86x66 rectangle at position (374, 155) then Places a magenta circle of radius 71 at center (417, 81).
; PLAN: r0=331(x1), r1=43(y1), r2=169(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=155(y), r7=86(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=81(y), r12=71(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 43
LDI r2, 169
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 155
LDI r7, 86
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 81
LDI r12, 71
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

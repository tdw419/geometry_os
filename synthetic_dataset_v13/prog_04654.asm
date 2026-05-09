; DESCRIPTION: Composite: Renders a black line between points (147, 12) and (77, 251) then Sets a single yellow pixel at (54, 9) then Renders a orange box of size 53x118 starting at (387, 66).
; PLAN: r0=147(x1), r1=12(y1), r2=77(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=9(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=387(x), r11=66(y), r12=53(width), r13=118(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 12
LDI r2, 77
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 9
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 387
LDI r11, 66
LDI r12, 53
LDI r13, 118
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

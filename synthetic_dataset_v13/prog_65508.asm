; DESCRIPTION: Composite: Draws a yellow line from (345, 14) to (91, 72) then Sets a single blue pixel at (330, 224) then Renders a yellow box of size 90x41 starting at (159, 66).
; PLAN: r0=345(x1), r1=14(y1), r2=91(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=224(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=66(y), r12=90(width), r13=41(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 14
LDI r2, 91
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 224
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 159
LDI r11, 66
LDI r12, 90
LDI r13, 41
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

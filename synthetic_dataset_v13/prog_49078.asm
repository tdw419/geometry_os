; DESCRIPTION: Composite: Places a blue line segment connecting (212, 66) to (41, 186) then Creates a yellow rectangular region at (368, 194) spanning 112 by 41 pixels then Creates a red circular shape at (365, 136) with radius 44.
; PLAN: r0=212(x1), r1=66(y1), r2=41(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=194(y), r7=112(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=136(y), r12=44(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 66
LDI r2, 41
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 194
LDI r7, 112
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 136
LDI r12, 44
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

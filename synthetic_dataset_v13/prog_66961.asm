; DESCRIPTION: Composite: Renders a orange line between points (366, 98) and (241, 171) then Sets a single white pixel at (234, 131) then Renders a white box of size 88x91 starting at (247, 66).
; PLAN: r0=366(x1), r1=98(y1), r2=241(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=131(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=66(y), r12=88(width), r13=91(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 98
LDI r2, 241
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 131
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 66
LDI r12, 88
LDI r13, 91
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

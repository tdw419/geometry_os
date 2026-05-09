; DESCRIPTION: Composite: Creates a magenta rectangular region at (119, 171) spanning 89 by 34 pixels then Places a blue line segment connecting (328, 203) to (234, 212) then Sets a single blue pixel at (188, 49).
; PLAN: r0=119(x), r1=171(y), r2=89(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=203(y1), r7=234(x2), r8=212(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=49(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 171
LDI r2, 89
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 203
LDI r7, 234
LDI r8, 212
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 49
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

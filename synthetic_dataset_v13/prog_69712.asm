; DESCRIPTION: Composite: Places a black line segment connecting (206, 85) to (398, 131) then Creates a green rectangular region at (440, 55) spanning 29 by 114 pixels then Sets a single green pixel at (17, 157).
; PLAN: r0=206(x1), r1=85(y1), r2=398(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=55(y), r7=29(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=17(x), r11=157(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 206
LDI r1, 85
LDI r2, 398
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 55
LDI r7, 29
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 157
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

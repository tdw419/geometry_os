; DESCRIPTION: Composite: Creates a purple rectangular region at (340, 29) spanning 95 by 58 pixels then Places a orange line segment connecting (453, 241) to (261, 180) then Sets a single red pixel at (38, 103).
; PLAN: r0=340(x), r1=29(y), r2=95(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=241(y1), r7=261(x2), r8=180(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=38(x), r11=103(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 29
LDI r2, 95
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 241
LDI r7, 261
LDI r8, 180
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 103
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

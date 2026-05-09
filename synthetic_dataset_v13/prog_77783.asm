; DESCRIPTION: Composite: Places a blue line segment connecting (111, 83) to (364, 117) then Sets a single green pixel at (2, 52) then Creates a magenta rectangular region at (336, 109) spanning 35 by 38 pixels.
; PLAN: r0=111(x1), r1=83(y1), r2=364(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=52(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=109(y), r12=35(width), r13=38(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 83
LDI r2, 364
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 52
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 336
LDI r11, 109
LDI r12, 35
LDI r13, 38
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

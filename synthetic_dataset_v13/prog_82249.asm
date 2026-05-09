; DESCRIPTION: Composite: Draws a black rectangle at (139, 0) with width 70 and height 103 then Sets a single white pixel at (336, 31) then Places a purple line segment connecting (438, 139) to (91, 218).
; PLAN: r0=139(x), r1=0(y), r2=70(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=31(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=438(x1), r11=139(y1), r12=91(x2), r13=218(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 0
LDI r2, 70
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 31
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 139
LDI r12, 91
LDI r13, 218
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

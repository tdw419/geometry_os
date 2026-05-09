; DESCRIPTION: Composite: Creates a yellow rectangular region at (67, 15) spanning 50 by 43 pixels then Sets a single red pixel at (192, 149) then Places a blue line segment connecting (392, 106) to (112, 53).
; PLAN: r0=67(x), r1=15(y), r2=50(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=149(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=392(x1), r11=106(y1), r12=112(x2), r13=53(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 15
LDI r2, 50
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 149
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 392
LDI r11, 106
LDI r12, 112
LDI r13, 53
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

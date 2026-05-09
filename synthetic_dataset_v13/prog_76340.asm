; DESCRIPTION: Composite: Places a blue line segment connecting (300, 101) to (389, 41) then Sets a single black pixel at (152, 228) then Renders a purple box of size 47x36 starting at (427, 31).
; PLAN: r0=300(x1), r1=101(y1), r2=389(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=228(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=427(x), r11=31(y), r12=47(width), r13=36(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 101
LDI r2, 389
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 228
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 427
LDI r11, 31
LDI r12, 47
LDI r13, 36
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

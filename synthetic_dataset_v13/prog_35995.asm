; DESCRIPTION: Composite: Places a black dot at position (2, 21) then Places a yellow 79x50 rectangle at position (287, 127) then Places a purple line segment connecting (161, 133) to (151, 191).
; PLAN: r0=2(x), r1=21(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=127(y), r7=79(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x1), r11=133(y1), r12=151(x2), r13=191(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 21
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 127
LDI r7, 79
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 133
LDI r12, 151
LDI r13, 191
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

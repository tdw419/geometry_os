; DESCRIPTION: Composite: Places a purple line segment connecting (59, 59) to (393, 53) then Sets a single red pixel at (1, 104) then Places a black 38x25 rectangle at position (114, 76).
; PLAN: r0=59(x1), r1=59(y1), r2=393(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=76(y), r12=38(width), r13=25(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 59
LDI r2, 393
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 114
LDI r11, 76
LDI r12, 38
LDI r13, 25
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

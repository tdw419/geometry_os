; DESCRIPTION: Composite: Places a purple line segment connecting (68, 27) to (376, 24) then Sets a single black pixel at (186, 63) then Places a red 46x35 rectangle at position (91, 92).
; PLAN: r0=68(x1), r1=27(y1), r2=376(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=63(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=91(x), r11=92(y), r12=46(width), r13=35(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 27
LDI r2, 376
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 63
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 91
LDI r11, 92
LDI r12, 46
LDI r13, 35
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

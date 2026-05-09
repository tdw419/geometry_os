; DESCRIPTION: Composite: Renders a orange line between points (254, 186) and (200, 84) then Sets a single blue pixel at (493, 254) then Places a purple 61x69 rectangle at position (413, 74).
; PLAN: r0=254(x1), r1=186(y1), r2=200(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=254(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=74(y), r12=61(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 186
LDI r2, 200
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 254
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 413
LDI r11, 74
LDI r12, 61
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

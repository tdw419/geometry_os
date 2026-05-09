; DESCRIPTION: Composite: Draws a blue line from (463, 111) to (368, 4) then Sets a single blue pixel at (503, 53) then Places a purple 71x101 rectangle at position (58, 107).
; PLAN: r0=463(x1), r1=111(y1), r2=368(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=503(x), r6=53(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=107(y), r12=71(width), r13=101(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 111
LDI r2, 368
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 53
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 107
LDI r12, 71
LDI r13, 101
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Draws a black rectangle at (16, 36) with width 73 and height 94 then Sets a single white pixel at (408, 255) then Places a purple line segment connecting (423, 173) to (470, 194).
; PLAN: r0=16(x), r1=36(y), r2=73(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=423(x1), r11=173(y1), r12=470(x2), r13=194(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 36
LDI r2, 73
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 423
LDI r11, 173
LDI r12, 470
LDI r13, 194
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Draws a blue line from (206, 228) to (64, 97) then Sets a single red pixel at (497, 32) then Creates a black rectangular region at (449, 2) spanning 11 by 88 pixels.
; PLAN: r0=206(x1), r1=228(y1), r2=64(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=32(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=449(x), r11=2(y), r12=11(width), r13=88(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 228
LDI r2, 64
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 32
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 449
LDI r11, 2
LDI r12, 11
LDI r13, 88
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

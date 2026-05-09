; DESCRIPTION: Composite: Draws a black line from (5, 144) to (314, 12) then Sets a single yellow pixel at (413, 193) then Places a blue 90x25 rectangle at position (92, 87).
; PLAN: r0=5(x1), r1=144(y1), r2=314(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=87(y), r12=90(width), r13=25(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 144
LDI r2, 314
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 92
LDI r11, 87
LDI r12, 90
LDI r13, 25
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

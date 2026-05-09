; DESCRIPTION: Composite: Sets a single orange pixel at (97, 36) then Renders a blue line between points (199, 181) and (362, 48) then Renders a yellow box of size 88x79 starting at (354, 114).
; PLAN: r0=97(x), r1=36(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=199(x1), r6=181(y1), r7=362(x2), r8=48(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=114(y), r12=88(width), r13=79(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 36
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 199
LDI r6, 181
LDI r7, 362
LDI r8, 48
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 114
LDI r12, 88
LDI r13, 79
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

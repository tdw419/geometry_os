; DESCRIPTION: Composite: Creates a blue rectangular region at (322, 86) spanning 103 by 120 pixels then Sets a single red pixel at (236, 109) then Places a black line segment connecting (36, 188) to (486, 205).
; PLAN: r0=322(x), r1=86(y), r2=103(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=36(x1), r11=188(y1), r12=486(x2), r13=205(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 86
LDI r2, 103
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 36
LDI r11, 188
LDI r12, 486
LDI r13, 205
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

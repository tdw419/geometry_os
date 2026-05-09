; DESCRIPTION: Composite: Sets a single magenta pixel at (279, 122) then Creates a purple rectangular region at (112, 58) spanning 20 by 100 pixels then Draws a green line from (278, 36) to (459, 235).
; PLAN: r0=279(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=58(y), r7=20(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x1), r11=36(y1), r12=459(x2), r13=235(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 58
LDI r7, 20
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 36
LDI r12, 459
LDI r13, 235
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

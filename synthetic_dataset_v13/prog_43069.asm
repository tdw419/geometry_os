; DESCRIPTION: Composite: Places a green dot at position (277, 77) then Draws a yellow line from (247, 17) to (437, 56) then Creates a black rectangular region at (147, 126) spanning 49 by 66 pixels.
; PLAN: r0=277(x), r1=77(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=17(y1), r7=437(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=126(y), r12=49(width), r13=66(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 77
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 17
LDI r7, 437
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 126
LDI r12, 49
LDI r13, 66
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

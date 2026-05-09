; DESCRIPTION: Composite: Creates a purple rectangular region at (260, 44) spanning 77 by 54 pixels then Creates a magenta circular shape at (141, 153) with radius 55 then Draws a black line from (407, 213) to (151, 111).
; PLAN: r0=260(x), r1=44(y), r2=77(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=153(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x1), r11=213(y1), r12=151(x2), r13=111(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 44
LDI r2, 77
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 153
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 213
LDI r12, 151
LDI r13, 111
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

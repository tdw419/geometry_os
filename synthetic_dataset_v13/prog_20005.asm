; DESCRIPTION: Composite: Draws a magenta line from (500, 47) to (269, 145) then Creates a blue circular shape at (469, 107) with radius 25 then Creates a purple rectangular region at (260, 121) spanning 117 by 14 pixels.
; PLAN: r0=500(x1), r1=47(y1), r2=269(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=107(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x), r11=121(y), r12=117(width), r13=14(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 47
LDI r2, 269
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 107
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 121
LDI r12, 117
LDI r13, 14
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

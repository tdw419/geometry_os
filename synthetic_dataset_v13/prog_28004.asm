; DESCRIPTION: Composite: Creates a yellow rectangular region at (56, 165) spanning 117 by 90 pixels then Places a black dot at position (127, 55) then Places a black line segment connecting (371, 58) to (54, 142).
; PLAN: r0=56(x), r1=165(y), r2=117(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=55(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=371(x1), r11=58(y1), r12=54(x2), r13=142(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 165
LDI r2, 117
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 55
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 371
LDI r11, 58
LDI r12, 54
LDI r13, 142
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a black line segment connecting (377, 135) to (330, 223) then Sets a single red pixel at (45, 142) then Creates a white rectangular region at (123, 22) spanning 104 by 82 pixels.
; PLAN: r0=377(x1), r1=135(y1), r2=330(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=142(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=22(y), r12=104(width), r13=82(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 135
LDI r2, 330
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 142
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 123
LDI r11, 22
LDI r12, 104
LDI r13, 82
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

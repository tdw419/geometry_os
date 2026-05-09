; DESCRIPTION: Composite: Places a black line segment connecting (480, 159) to (321, 119) then Places a red dot at position (312, 103) then Creates a white rectangular region at (69, 16) spanning 21 by 65 pixels.
; PLAN: r0=480(x1), r1=159(y1), r2=321(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=16(y), r12=21(width), r13=65(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 159
LDI r2, 321
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 69
LDI r11, 16
LDI r12, 21
LDI r13, 65
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

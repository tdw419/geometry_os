; DESCRIPTION: Composite: Creates a orange circular shape at (132, 115) with radius 55 then Draws a red line from (325, 122) to (473, 77) then Creates a black rectangular region at (146, 116) spanning 14 by 75 pixels.
; PLAN: r0=132(x), r1=115(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x1), r6=122(y1), r7=473(x2), r8=77(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=116(y), r12=14(width), r13=75(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 115
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 122
LDI r7, 473
LDI r8, 77
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 116
LDI r12, 14
LDI r13, 75
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

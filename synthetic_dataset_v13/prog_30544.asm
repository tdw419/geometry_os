; DESCRIPTION: Composite: Draws a black line from (5, 247) to (241, 25) then Places a black circle of radius 66 at center (231, 121) then Creates a black rectangular region at (120, 47) spanning 120 by 116 pixels.
; PLAN: r0=5(x1), r1=247(y1), r2=241(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=121(y), r7=66(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=47(y), r12=120(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 247
LDI r2, 241
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 121
LDI r7, 66
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 47
LDI r12, 120
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

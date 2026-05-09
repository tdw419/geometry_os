; DESCRIPTION: Composite: Renders a yellow line between points (244, 64) and (411, 105) then Sets a single white pixel at (143, 139) then Creates a yellow rectangular region at (385, 103) spanning 70 by 31 pixels.
; PLAN: r0=244(x1), r1=64(y1), r2=411(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=139(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=103(y), r12=70(width), r13=31(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 64
LDI r2, 411
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 139
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 103
LDI r12, 70
LDI r13, 31
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

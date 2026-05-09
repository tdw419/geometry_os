; DESCRIPTION: Composite: Creates a black rectangular region at (218, 0) spanning 103 by 110 pixels then Renders a purple line between points (391, 120) and (102, 125) then Renders a black disk with center (347, 149) and radius 74.
; PLAN: r0=218(x), r1=0(y), r2=103(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=120(y1), r7=102(x2), r8=125(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=149(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 0
LDI r2, 103
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 120
LDI r7, 102
LDI r8, 125
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 149
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

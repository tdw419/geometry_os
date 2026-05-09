; DESCRIPTION: Composite: Creates a black rectangular region at (321, 95) spanning 104 by 104 pixels then Places a magenta line segment connecting (342, 80) to (467, 149) then Renders a black disk with center (233, 198) and radius 16.
; PLAN: r0=321(x), r1=95(y), r2=104(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=80(y1), r7=467(x2), r8=149(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=198(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 95
LDI r2, 104
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 80
LDI r7, 467
LDI r8, 149
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 198
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

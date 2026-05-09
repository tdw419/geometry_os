; DESCRIPTION: Composite: Creates a red rectangular region at (392, 178) spanning 74 by 25 pixels then Creates a white circular shape at (438, 50) with radius 25 then Places a white line segment connecting (383, 155) to (80, 206).
; PLAN: r0=392(x), r1=178(y), r2=74(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=50(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x1), r11=155(y1), r12=80(x2), r13=206(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 178
LDI r2, 74
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 50
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 155
LDI r12, 80
LDI r13, 206
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

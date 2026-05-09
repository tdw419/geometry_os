; DESCRIPTION: Composite: Places a orange line segment connecting (14, 106) to (244, 80) then Draws a purple circle centered at (132, 170) with radius 71 then Places a green 27x75 rectangle at position (251, 174).
; PLAN: r0=14(x1), r1=106(y1), r2=244(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=170(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=174(y), r12=27(width), r13=75(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 106
LDI r2, 244
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 170
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 174
LDI r12, 27
LDI r13, 75
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

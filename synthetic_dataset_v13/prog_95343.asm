; DESCRIPTION: Composite: Draws a black line from (388, 143) to (404, 128) then Creates a red rectangular region at (397, 75) spanning 91 by 99 pixels then Draws a yellow circle centered at (229, 40) with radius 23.
; PLAN: r0=388(x1), r1=143(y1), r2=404(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=75(y), r7=91(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=40(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 143
LDI r2, 404
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 75
LDI r7, 91
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 40
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

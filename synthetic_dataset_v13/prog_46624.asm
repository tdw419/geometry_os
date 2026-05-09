; DESCRIPTION: Composite: Draws a black circle centered at (65, 121) with radius 63 then Creates a orange rectangular region at (305, 95) spanning 80 by 115 pixels then Draws a green line from (456, 250) to (294, 249).
; PLAN: r0=65(x), r1=121(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=95(y), r7=80(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x1), r11=250(y1), r12=294(x2), r13=249(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 121
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 95
LDI r7, 80
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 250
LDI r12, 294
LDI r13, 249
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

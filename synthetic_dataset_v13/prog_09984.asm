; DESCRIPTION: Composite: Creates a black rectangular region at (222, 13) spanning 63 by 116 pixels then Draws a orange line from (241, 168) to (454, 155).
; PLAN: r0=222(x), r1=13(y), r2=63(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x1), r6=168(y1), r7=454(x2), r8=155(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 13
LDI r2, 63
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 168
LDI r7, 454
LDI r8, 155
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

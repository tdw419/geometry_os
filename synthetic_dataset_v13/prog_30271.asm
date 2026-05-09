; DESCRIPTION: Composite: Creates a black rectangular region at (420, 156) spanning 31 by 80 pixels then Sets a single red pixel at (389, 249) then Draws a blue line from (404, 137) to (268, 168).
; PLAN: r0=420(x), r1=156(y), r2=31(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=249(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=404(x1), r11=137(y1), r12=268(x2), r13=168(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 156
LDI r2, 31
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 249
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 404
LDI r11, 137
LDI r12, 268
LDI r13, 168
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

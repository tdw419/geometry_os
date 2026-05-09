; DESCRIPTION: Composite: Draws a black line from (483, 231) to (379, 168) then Places a yellow dot at position (335, 110) then Creates a black rectangular region at (315, 165) spanning 72 by 54 pixels.
; PLAN: r0=483(x1), r1=231(y1), r2=379(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=165(y), r12=72(width), r13=54(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 231
LDI r2, 379
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 315
LDI r11, 165
LDI r12, 72
LDI r13, 54
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

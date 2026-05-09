; DESCRIPTION: Composite: Creates a magenta rectangular region at (119, 208) spanning 13 by 31 pixels then Sets a single black pixel at (10, 48) then Draws a red line from (295, 29) to (273, 69).
; PLAN: r0=119(x), r1=208(y), r2=13(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=48(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=295(x1), r11=29(y1), r12=273(x2), r13=69(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 208
LDI r2, 13
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 48
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 295
LDI r11, 29
LDI r12, 273
LDI r13, 69
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

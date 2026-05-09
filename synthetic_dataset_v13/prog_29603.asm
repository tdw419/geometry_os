; DESCRIPTION: Composite: Creates a orange rectangular region at (163, 89) spanning 119 by 120 pixels then Draws a green line from (456, 45) to (67, 171) then Draws a yellow circle centered at (369, 93) with radius 73.
; PLAN: r0=163(x), r1=89(y), r2=119(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x1), r6=45(y1), r7=67(x2), r8=171(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=93(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 89
LDI r2, 119
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 45
LDI r7, 67
LDI r8, 171
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 93
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

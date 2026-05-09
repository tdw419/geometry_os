; DESCRIPTION: Composite: Draws a purple line from (3, 60) to (1, 80) then Places a green circle of radius 41 at center (369, 91) then Creates a red rectangular region at (171, 93) spanning 56 by 42 pixels.
; PLAN: r0=3(x1), r1=60(y1), r2=1(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=91(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=93(y), r12=56(width), r13=42(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 3
LDI r1, 60
LDI r2, 1
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 91
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 93
LDI r12, 56
LDI r13, 42
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

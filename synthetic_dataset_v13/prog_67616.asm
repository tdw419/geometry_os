; DESCRIPTION: Composite: Draws a red line from (372, 146) to (28, 91) then Places a green 58x60 rectangle at position (56, 0) then Creates a purple circular shape at (250, 106) with radius 79.
; PLAN: r0=372(x1), r1=146(y1), r2=28(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=0(y), r7=58(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x), r11=106(y), r12=79(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 372
LDI r1, 146
LDI r2, 28
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 0
LDI r7, 58
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 106
LDI r12, 79
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

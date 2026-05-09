; DESCRIPTION: Composite: Places a blue circle of radius 10 at center (78, 153) then Creates a black rectangular region at (273, 27) spanning 57 by 34 pixels then Draws a red line from (106, 144) to (131, 86).
; PLAN: r0=78(x), r1=153(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=27(y), r7=57(width), r8=34(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x1), r11=144(y1), r12=131(x2), r13=86(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 153
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 27
LDI r7, 57
LDI r8, 34
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 144
LDI r12, 131
LDI r13, 86
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

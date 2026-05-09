; DESCRIPTION: Composite: Places a red circle of radius 40 at center (368, 95) then Creates a purple rectangular region at (138, 9) spanning 64 by 79 pixels then Draws a green line from (65, 91) to (129, 205).
; PLAN: r0=368(x), r1=95(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=9(y), r7=64(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x1), r11=91(y1), r12=129(x2), r13=205(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 95
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 9
LDI r7, 64
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 91
LDI r12, 129
LDI r13, 205
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

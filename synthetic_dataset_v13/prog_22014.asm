; DESCRIPTION: Composite: Renders a green line between points (344, 174) and (268, 142) then Sets a single yellow pixel at (291, 234) then Creates a magenta rectangular region at (206, 161) spanning 80 by 61 pixels.
; PLAN: r0=344(x1), r1=174(y1), r2=268(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=234(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=161(y), r12=80(width), r13=61(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 174
LDI r2, 268
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 234
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 206
LDI r11, 161
LDI r12, 80
LDI r13, 61
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

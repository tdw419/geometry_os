; DESCRIPTION: Composite: Creates a magenta rectangular region at (82, 77) spanning 16 by 80 pixels then Draws a magenta circle centered at (225, 126) with radius 44 then Draws a orange line from (327, 169) to (362, 110).
; PLAN: r0=82(x), r1=77(y), r2=16(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=126(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=327(x1), r11=169(y1), r12=362(x2), r13=110(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 77
LDI r2, 16
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 126
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 327
LDI r11, 169
LDI r12, 362
LDI r13, 110
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

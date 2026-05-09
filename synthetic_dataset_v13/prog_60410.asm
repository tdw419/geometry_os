; DESCRIPTION: Composite: Creates a black circular shape at (221, 208) with radius 13 then Draws a magenta line from (184, 187) to (44, 141) then Creates a orange rectangular region at (226, 131) spanning 82 by 56 pixels.
; PLAN: r0=221(x), r1=208(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x1), r6=187(y1), r7=44(x2), r8=141(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=131(y), r12=82(width), r13=56(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 208
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 187
LDI r7, 44
LDI r8, 141
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 131
LDI r12, 82
LDI r13, 56
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

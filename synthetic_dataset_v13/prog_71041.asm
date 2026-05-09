; DESCRIPTION: Composite: Places a yellow dot at position (94, 187) then Draws a blue line from (337, 254) to (1, 53) then Creates a green rectangular region at (222, 7) spanning 117 by 47 pixels.
; PLAN: r0=94(x), r1=187(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=254(y1), r7=1(x2), r8=53(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=7(y), r12=117(width), r13=47(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 187
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 254
LDI r7, 1
LDI r8, 53
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 7
LDI r12, 117
LDI r13, 47
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

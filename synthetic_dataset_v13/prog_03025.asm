; DESCRIPTION: Composite: Creates a red rectangular region at (89, 38) spanning 44 by 81 pixels then Places a magenta dot at position (476, 242) then Draws a orange line from (431, 138) to (106, 84).
; PLAN: r0=89(x), r1=38(y), r2=44(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=242(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=431(x1), r11=138(y1), r12=106(x2), r13=84(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 38
LDI r2, 44
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 242
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 138
LDI r12, 106
LDI r13, 84
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

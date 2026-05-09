; DESCRIPTION: Composite: Places a green dot at position (364, 125) then Draws a black line from (377, 226) to (431, 121) then Creates a red rectangular region at (334, 131) spanning 59 by 105 pixels.
; PLAN: r0=364(x), r1=125(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=377(x1), r6=226(y1), r7=431(x2), r8=121(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=131(y), r12=59(width), r13=105(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 125
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 377
LDI r6, 226
LDI r7, 431
LDI r8, 121
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 131
LDI r12, 59
LDI r13, 105
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a purple dot at position (464, 149) then Creates a black rectangular region at (432, 39) spanning 59 by 99 pixels then Draws a red line from (408, 164) to (200, 193).
; PLAN: r0=464(x), r1=149(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=39(y), r7=59(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x1), r11=164(y1), r12=200(x2), r13=193(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 149
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 432
LDI r6, 39
LDI r7, 59
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 164
LDI r12, 200
LDI r13, 193
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

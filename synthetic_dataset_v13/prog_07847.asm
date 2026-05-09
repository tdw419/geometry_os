; DESCRIPTION: Composite: Renders a purple box of size 68x109 starting at (406, 61) then Sets a single magenta pixel at (45, 247) then Draws a black line from (471, 169) to (344, 59).
; PLAN: r0=406(x), r1=61(y), r2=68(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=471(x1), r11=169(y1), r12=344(x2), r13=59(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 61
LDI r2, 68
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 471
LDI r11, 169
LDI r12, 344
LDI r13, 59
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

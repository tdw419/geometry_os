; DESCRIPTION: Composite: Creates a magenta rectangular region at (300, 185) spanning 63 by 23 pixels then Places a black dot at position (492, 16) then Renders a purple line between points (229, 26) and (135, 148).
; PLAN: r0=300(x), r1=185(y), r2=63(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=16(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=229(x1), r11=26(y1), r12=135(x2), r13=148(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 185
LDI r2, 63
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 16
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 229
LDI r11, 26
LDI r12, 135
LDI r13, 148
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

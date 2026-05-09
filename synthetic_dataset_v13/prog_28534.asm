; DESCRIPTION: Composite: Renders a magenta line between points (417, 122) and (388, 229) then Creates a orange rectangular region at (389, 158) spanning 65 by 77 pixels then Places a black circle of radius 29 at center (140, 132).
; PLAN: r0=417(x1), r1=122(y1), r2=388(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=158(y), r7=65(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x), r11=132(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 122
LDI r2, 388
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 158
LDI r7, 65
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 132
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

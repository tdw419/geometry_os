; DESCRIPTION: Composite: Draws a black line from (356, 174) to (106, 127) then Places a orange dot at position (487, 162) then Creates a purple rectangular region at (94, 78) spanning 65 by 102 pixels.
; PLAN: r0=356(x1), r1=174(y1), r2=106(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=162(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=78(y), r12=65(width), r13=102(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 174
LDI r2, 106
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 162
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 94
LDI r11, 78
LDI r12, 65
LDI r13, 102
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

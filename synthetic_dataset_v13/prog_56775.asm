; DESCRIPTION: Composite: Renders a black line between points (317, 4) and (161, 118) then Places a blue dot at position (476, 35) then Creates a orange rectangular region at (47, 44) spanning 51 by 27 pixels.
; PLAN: r0=317(x1), r1=4(y1), r2=161(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=35(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=44(y), r12=51(width), r13=27(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 4
LDI r2, 161
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 35
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 47
LDI r11, 44
LDI r12, 51
LDI r13, 27
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

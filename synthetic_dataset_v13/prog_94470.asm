; DESCRIPTION: Composite: Places a purple dot at position (229, 230) then Renders a orange line between points (148, 162) and (451, 146) then Places a blue 42x55 rectangle at position (44, 51).
; PLAN: r0=229(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=162(y1), r7=451(x2), r8=146(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=51(y), r12=42(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 162
LDI r7, 451
LDI r8, 146
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 51
LDI r12, 42
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

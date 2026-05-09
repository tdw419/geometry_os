; DESCRIPTION: Composite: Sets a single black pixel at (149, 237) then Draws a orange line from (0, 68) to (329, 216) then Places a purple 63x60 rectangle at position (7, 119).
; PLAN: r0=149(x), r1=237(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=0(x1), r6=68(y1), r7=329(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=119(y), r12=63(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 237
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 0
LDI r6, 68
LDI r7, 329
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 119
LDI r12, 63
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

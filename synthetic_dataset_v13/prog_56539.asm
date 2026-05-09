; DESCRIPTION: Composite: Draws a orange line from (311, 96) to (498, 247) then Places a magenta dot at position (396, 232) then Places a black 20x36 rectangle at position (470, 143).
; PLAN: r0=311(x1), r1=96(y1), r2=498(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=232(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=470(x), r11=143(y), r12=20(width), r13=36(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 96
LDI r2, 498
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 232
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 470
LDI r11, 143
LDI r12, 20
LDI r13, 36
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

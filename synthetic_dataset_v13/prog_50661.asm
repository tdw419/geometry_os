; DESCRIPTION: Composite: Renders a purple box of size 45x62 starting at (279, 20) then Places a orange dot at position (467, 118) then Places a yellow line segment connecting (111, 181) to (387, 90).
; PLAN: r0=279(x), r1=20(y), r2=45(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=118(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=181(y1), r12=387(x2), r13=90(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 20
LDI r2, 45
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 118
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 111
LDI r11, 181
LDI r12, 387
LDI r13, 90
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

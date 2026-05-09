; DESCRIPTION: Composite: Draws a orange line from (150, 49) to (35, 101) then Sets a single black pixel at (93, 216) then Places a green 103x86 rectangle at position (6, 4).
; PLAN: r0=150(x1), r1=49(y1), r2=35(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=6(x), r11=4(y), r12=103(width), r13=86(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 49
LDI r2, 35
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 6
LDI r11, 4
LDI r12, 103
LDI r13, 86
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

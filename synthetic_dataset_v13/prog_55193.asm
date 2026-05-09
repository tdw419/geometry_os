; DESCRIPTION: Composite: Renders a black line between points (311, 80) and (249, 232) then Sets a single yellow pixel at (23, 175) then Places a purple 53x54 rectangle at position (205, 16).
; PLAN: r0=311(x1), r1=80(y1), r2=249(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=175(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=205(x), r11=16(y), r12=53(width), r13=54(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 80
LDI r2, 249
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 175
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 205
LDI r11, 16
LDI r12, 53
LDI r13, 54
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

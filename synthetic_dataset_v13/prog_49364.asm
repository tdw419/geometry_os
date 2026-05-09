; DESCRIPTION: Composite: Draws a blue line from (258, 127) to (326, 201) then Places a purple 62x75 rectangle at position (81, 94) then Sets a single yellow pixel at (16, 43).
; PLAN: r0=258(x1), r1=127(y1), r2=326(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=94(y), r7=62(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=16(x), r11=43(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 127
LDI r2, 326
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 94
LDI r7, 62
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 43
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Places a purple 19x36 rectangle at position (200, 6) then Draws a red line from (175, 53) to (429, 133) then Sets a single orange pixel at (409, 130).
; PLAN: r0=200(x), r1=6(y), r2=19(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=53(y1), r7=429(x2), r8=133(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=130(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 6
LDI r2, 19
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 53
LDI r7, 429
LDI r8, 133
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 130
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

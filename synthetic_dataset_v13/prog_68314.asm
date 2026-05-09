; DESCRIPTION: Composite: Places a green 32x110 rectangle at position (424, 66) then Draws a magenta line from (447, 102) to (359, 121) then Places a orange dot at position (32, 216).
; PLAN: r0=424(x), r1=66(y), r2=32(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x1), r6=102(y1), r7=359(x2), r8=121(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=216(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 66
LDI r2, 32
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 102
LDI r7, 359
LDI r8, 121
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 216
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

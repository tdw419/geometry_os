; DESCRIPTION: Composite: Places a blue 65x24 rectangle at position (244, 15) then Draws a magenta line from (216, 69) to (5, 184) then Sets a single blue pixel at (63, 123).
; PLAN: r0=244(x), r1=15(y), r2=65(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=69(y1), r7=5(x2), r8=184(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=123(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 15
LDI r2, 65
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 69
LDI r7, 5
LDI r8, 184
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 123
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

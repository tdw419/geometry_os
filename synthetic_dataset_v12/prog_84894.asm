; DESCRIPTION: Composite: Renders a cyan box of size 97x58 starting at (338, 150) then Draws a orange line from (464, 1) to (449, 133) then Sets a single yellow pixel at (76, 185).
; PLAN: r0=338(x), r1=150(y), r2=97(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=1(y1), r7=449(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=185(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 150
LDI r2, 97
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 1
LDI r7, 449
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 185
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

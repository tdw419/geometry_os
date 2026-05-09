; DESCRIPTION: Composite: Draws a orange line from (188, 70) to (389, 19) then Places a black 98x65 rectangle at position (41, 130) then Sets a single blue pixel at (428, 202).
; PLAN: r0=188(x1), r1=70(y1), r2=389(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=130(y), r7=98(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=202(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 188
LDI r1, 70
LDI r2, 389
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 130
LDI r7, 98
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 202
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

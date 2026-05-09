; DESCRIPTION: Composite: Draws a orange line from (219, 235) to (464, 182) then Draws a green rectangle at (461, 67) with width 27 and height 91 then Sets a single red pixel at (302, 58).
; PLAN: r0=219(x1), r1=235(y1), r2=464(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=67(y), r7=27(width), r8=91(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=58(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 235
LDI r2, 464
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 67
LDI r7, 27
LDI r8, 91
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 58
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

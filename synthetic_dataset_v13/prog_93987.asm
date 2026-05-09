; DESCRIPTION: Composite: Places a black line segment connecting (292, 180) to (126, 235) then Draws a yellow rectangle at (216, 51) with width 60 and height 117 then Draws a orange circle centered at (108, 180) with radius 18.
; PLAN: r0=292(x1), r1=180(y1), r2=126(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=51(y), r7=60(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=180(y), r12=18(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 180
LDI r2, 126
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 51
LDI r7, 60
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 180
LDI r12, 18
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

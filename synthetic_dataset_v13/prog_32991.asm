; DESCRIPTION: Composite: Places a blue 94x59 rectangle at position (232, 178) then Places a orange line segment connecting (94, 37) to (114, 130) then Places a black dot at position (158, 149).
; PLAN: r0=232(x), r1=178(y), r2=94(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x1), r6=37(y1), r7=114(x2), r8=130(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=149(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 178
LDI r2, 94
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 37
LDI r7, 114
LDI r8, 130
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 149
LDI r12, 0x000000
PSET r10, r11, r12
HALT

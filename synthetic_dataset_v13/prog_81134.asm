; DESCRIPTION: Composite: Places a orange line segment connecting (449, 152) to (90, 248) then Renders a purple box of size 118x39 starting at (126, 41) then Draws a cyan circle centered at (53, 80) with radius 46.
; PLAN: r0=449(x1), r1=152(y1), r2=90(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=41(y), r7=118(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=80(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 152
LDI r2, 90
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 41
LDI r7, 118
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 80
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Places a green dot at position (490, 76) then Renders a orange box of size 14x17 starting at (266, 39) then Places a purple line segment connecting (364, 216) to (171, 81).
; PLAN: r0=490(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=39(y), r7=14(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x1), r11=216(y1), r12=171(x2), r13=81(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 266
LDI r6, 39
LDI r7, 14
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 216
LDI r12, 171
LDI r13, 81
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

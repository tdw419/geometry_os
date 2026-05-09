; DESCRIPTION: Composite: Sets a single orange pixel at (122, 232) then Renders a black box of size 99x67 starting at (117, 140) then Creates a blue circular shape at (428, 76) with radius 54.
; PLAN: r0=122(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=140(y), r7=99(width), r8=67(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=76(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 117
LDI r6, 140
LDI r7, 99
LDI r8, 67
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 76
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Places a orange dot at position (67, 59) then Creates a purple rectangular region at (370, 23) spanning 98 by 109 pixels then Creates a black circular shape at (120, 162) with radius 72.
; PLAN: r0=67(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=23(y), r7=98(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=162(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 370
LDI r6, 23
LDI r7, 98
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 162
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

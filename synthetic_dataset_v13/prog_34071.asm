; DESCRIPTION: Composite: Creates a white rectangular region at (210, 131) spanning 70 by 58 pixels then Places a orange dot at position (74, 170) then Creates a blue circular shape at (432, 116) with radius 57.
; PLAN: r0=210(x), r1=131(y), r2=70(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=170(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=116(y), r12=57(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 210
LDI r1, 131
LDI r2, 70
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 170
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 432
LDI r11, 116
LDI r12, 57
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Creates a white rectangular region at (74, 7) spanning 62 by 55 pixels then Places a orange dot at position (141, 82) then Places a green line segment connecting (44, 32) to (402, 172).
; PLAN: r0=74(x), r1=7(y), r2=62(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=82(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=44(x1), r11=32(y1), r12=402(x2), r13=172(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 7
LDI r2, 62
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 82
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 44
LDI r11, 32
LDI r12, 402
LDI r13, 172
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

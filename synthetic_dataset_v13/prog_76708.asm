; DESCRIPTION: Composite: Places a orange circle of radius 31 at center (150, 214) then Sets a single black pixel at (132, 105) then Places a magenta 34x67 rectangle at position (391, 141).
; PLAN: r0=150(x), r1=214(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=105(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=141(y), r12=34(width), r13=67(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 214
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 105
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 391
LDI r11, 141
LDI r12, 34
LDI r13, 67
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

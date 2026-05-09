; DESCRIPTION: Composite: Places a orange dot at position (278, 143) then Places a black 46x54 rectangle at position (321, 25) then Places a blue circle of radius 58 at center (449, 67).
; PLAN: r0=278(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=25(y), r7=46(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=449(x), r11=67(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 321
LDI r6, 25
LDI r7, 46
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 67
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Places a orange 112x98 rectangle at position (396, 69) then Places a cyan dot at position (314, 198) then Creates a orange circular shape at (362, 184) with radius 63.
; PLAN: r0=396(x), r1=69(y), r2=112(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=198(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=184(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 69
LDI r2, 112
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 198
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 362
LDI r11, 184
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

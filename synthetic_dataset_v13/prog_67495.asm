; DESCRIPTION: Composite: Places a green 96x16 rectangle at position (389, 124) then Places a orange dot at position (98, 11) then Places a yellow line segment connecting (266, 17) to (155, 67).
; PLAN: r0=389(x), r1=124(y), r2=96(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=11(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=266(x1), r11=17(y1), r12=155(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 124
LDI r2, 96
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 11
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 266
LDI r11, 17
LDI r12, 155
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

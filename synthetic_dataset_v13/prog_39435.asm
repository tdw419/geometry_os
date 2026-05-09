; DESCRIPTION: Composite: Draws a yellow line from (241, 135) to (151, 135) then Sets a single black pixel at (17, 130) then Places a orange 94x70 rectangle at position (105, 129).
; PLAN: r0=241(x1), r1=135(y1), r2=151(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=105(x), r11=129(y), r12=94(width), r13=70(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 135
LDI r2, 151
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 105
LDI r11, 129
LDI r12, 94
LDI r13, 70
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

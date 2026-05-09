; DESCRIPTION: Composite: Draws a magenta rectangle at (16, 15) with width 74 and height 107 then Sets a single black pixel at (129, 40) then Places a green line segment connecting (472, 222) to (449, 159).
; PLAN: r0=16(x), r1=15(y), r2=74(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=40(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=472(x1), r11=222(y1), r12=449(x2), r13=159(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 15
LDI r2, 74
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 40
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 472
LDI r11, 222
LDI r12, 449
LDI r13, 159
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

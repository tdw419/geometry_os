; DESCRIPTION: Composite: Draws a cyan rectangle at (111, 16) with width 30 and height 65 then Sets a single purple pixel at (10, 11) then Places a orange line segment connecting (396, 198) to (230, 217).
; PLAN: r0=111(x), r1=16(y), r2=30(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=11(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=396(x1), r11=198(y1), r12=230(x2), r13=217(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 16
LDI r2, 30
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 11
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 198
LDI r12, 230
LDI r13, 217
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

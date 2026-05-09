; DESCRIPTION: Composite: Draws a purple rectangle at (257, 216) with width 106 and height 28 then Places a cyan dot at position (100, 32) then Draws a orange line from (288, 233) to (396, 170).
; PLAN: r0=257(x), r1=216(y), r2=106(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=32(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=288(x1), r11=233(y1), r12=396(x2), r13=170(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 216
LDI r2, 106
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 32
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 233
LDI r12, 396
LDI r13, 170
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

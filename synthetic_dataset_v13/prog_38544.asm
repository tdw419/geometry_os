; DESCRIPTION: Composite: Draws a red line from (328, 64) to (479, 232) then Sets a single orange pixel at (409, 224) then Draws a purple rectangle at (318, 109) with width 25 and height 67.
; PLAN: r0=328(x1), r1=64(y1), r2=479(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=224(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=318(x), r11=109(y), r12=25(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 64
LDI r2, 479
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 224
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 318
LDI r11, 109
LDI r12, 25
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

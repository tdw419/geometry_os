; DESCRIPTION: Composite: Renders a cyan line between points (181, 191) and (419, 143) then Draws a purple circle centered at (257, 118) with radius 10 then Draws a purple rectangle at (402, 79) with width 39 and height 50.
; PLAN: r0=181(x1), r1=191(y1), r2=419(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=118(y), r7=10(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=79(y), r12=39(width), r13=50(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 191
LDI r2, 419
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 118
LDI r7, 10
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 79
LDI r12, 39
LDI r13, 50
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

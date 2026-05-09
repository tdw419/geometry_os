; DESCRIPTION: Composite: Places a black circle of radius 52 at center (185, 149) then Sets a single orange pixel at (358, 120) then Draws a purple rectangle at (2, 7) with width 19 and height 117.
; PLAN: r0=185(x), r1=149(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=2(x), r11=7(y), r12=19(width), r13=117(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 149
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 2
LDI r11, 7
LDI r12, 19
LDI r13, 117
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

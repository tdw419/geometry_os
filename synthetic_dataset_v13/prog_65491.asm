; DESCRIPTION: Composite: Places a orange circle of radius 31 at center (216, 118) then Sets a single black pixel at (78, 64) then Places a yellow 91x52 rectangle at position (97, 0).
; PLAN: r0=216(x), r1=118(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=64(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=0(y), r12=91(width), r13=52(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 118
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 64
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 97
LDI r11, 0
LDI r12, 91
LDI r13, 52
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

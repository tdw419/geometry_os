; DESCRIPTION: Composite: Creates a cyan rectangular region at (355, 71) spanning 84 by 101 pixels then Sets a single red pixel at (219, 145) then Places a orange circle of radius 19 at center (24, 123).
; PLAN: r0=355(x), r1=71(y), r2=84(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=145(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=123(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 71
LDI r2, 84
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 145
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 24
LDI r11, 123
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

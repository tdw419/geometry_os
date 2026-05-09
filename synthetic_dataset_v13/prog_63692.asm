; DESCRIPTION: Composite: Draws a cyan line from (390, 159) to (498, 14) then Creates a magenta circular shape at (314, 96) with radius 35 then Places a orange dot at position (60, 78).
; PLAN: r0=390(x1), r1=159(y1), r2=498(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=96(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=78(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 159
LDI r2, 498
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 96
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 78
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Draws a black line from (254, 137) to (495, 243) then Creates a magenta rectangular region at (40, 43) spanning 89 by 101 pixels then Sets a single purple pixel at (57, 193).
; PLAN: r0=254(x1), r1=137(y1), r2=495(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=43(y), r7=89(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x), r11=193(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 137
LDI r2, 495
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 43
LDI r7, 89
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 193
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

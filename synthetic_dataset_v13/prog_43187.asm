; DESCRIPTION: Composite: Draws a cyan line from (7, 149) to (341, 199) then Creates a orange rectangular region at (50, 84) spanning 119 by 70 pixels then Sets a single magenta pixel at (136, 219).
; PLAN: r0=7(x1), r1=149(y1), r2=341(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=84(y), r7=119(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=219(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 7
LDI r1, 149
LDI r2, 341
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 84
LDI r7, 119
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 219
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

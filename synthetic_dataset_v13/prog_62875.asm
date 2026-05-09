; DESCRIPTION: Composite: Renders a black line between points (417, 20) and (343, 191) then Sets a single yellow pixel at (160, 122) then Draws a magenta rectangle at (190, 34) with width 109 and height 75.
; PLAN: r0=417(x1), r1=20(y1), r2=343(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=122(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=34(y), r12=109(width), r13=75(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 20
LDI r2, 343
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 122
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 190
LDI r11, 34
LDI r12, 109
LDI r13, 75
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

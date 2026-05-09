; DESCRIPTION: Composite: Draws a orange line from (458, 36) to (4, 20) then Sets a single purple pixel at (158, 63) then Creates a red rectangular region at (71, 7) spanning 45 by 80 pixels.
; PLAN: r0=458(x1), r1=36(y1), r2=4(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=63(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=71(x), r11=7(y), r12=45(width), r13=80(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 36
LDI r2, 4
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 63
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 71
LDI r11, 7
LDI r12, 45
LDI r13, 80
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

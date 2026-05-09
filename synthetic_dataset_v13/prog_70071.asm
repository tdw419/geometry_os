; DESCRIPTION: Composite: Renders a orange line between points (144, 18) and (301, 56) then Sets a single green pixel at (484, 116) then Renders a cyan box of size 38x78 starting at (169, 70).
; PLAN: r0=144(x1), r1=18(y1), r2=301(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=116(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=70(y), r12=38(width), r13=78(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 18
LDI r2, 301
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 116
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 169
LDI r11, 70
LDI r12, 38
LDI r13, 78
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

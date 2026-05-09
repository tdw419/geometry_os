; DESCRIPTION: Composite: Renders a orange line between points (484, 129) and (306, 102) then Sets a single yellow pixel at (293, 42) then Creates a black rectangular region at (102, 56) spanning 11 by 81 pixels.
; PLAN: r0=484(x1), r1=129(y1), r2=306(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=42(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=102(x), r11=56(y), r12=11(width), r13=81(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 129
LDI r2, 306
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 42
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 102
LDI r11, 56
LDI r12, 11
LDI r13, 81
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

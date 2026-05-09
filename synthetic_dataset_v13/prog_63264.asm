; DESCRIPTION: Composite: Renders a yellow line between points (205, 245) and (402, 6) then Sets a single yellow pixel at (115, 151) then Creates a red rectangular region at (419, 43) spanning 44 by 85 pixels.
; PLAN: r0=205(x1), r1=245(y1), r2=402(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=151(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=43(y), r12=44(width), r13=85(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 245
LDI r2, 402
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 151
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 419
LDI r11, 43
LDI r12, 44
LDI r13, 85
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

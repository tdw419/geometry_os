; DESCRIPTION: Composite: Renders a red line between points (80, 85) and (78, 88) then Sets a single green pixel at (173, 63) then Draws a orange rectangle at (194, 53) with width 102 and height 42.
; PLAN: r0=80(x1), r1=85(y1), r2=78(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=63(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=53(y), r12=102(width), r13=42(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 85
LDI r2, 78
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 63
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 194
LDI r11, 53
LDI r12, 102
LDI r13, 42
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

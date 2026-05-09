; DESCRIPTION: Composite: Renders a orange line between points (236, 17) and (402, 132) then Creates a blue rectangular region at (306, 10) spanning 120 by 114 pixels.
; PLAN: r0=236(x1), r1=17(y1), r2=402(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=10(y), r7=120(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 17
LDI r2, 402
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 10
LDI r7, 120
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

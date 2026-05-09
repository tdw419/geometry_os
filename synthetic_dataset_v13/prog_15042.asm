; DESCRIPTION: Composite: Draws a yellow line from (172, 125) to (476, 193) then Creates a purple rectangular region at (289, 2) spanning 25 by 35 pixels.
; PLAN: r0=172(x1), r1=125(y1), r2=476(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=2(y), r7=25(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 125
LDI r2, 476
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 2
LDI r7, 25
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

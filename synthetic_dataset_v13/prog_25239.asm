; DESCRIPTION: Composite: Draws a purple line from (390, 79) to (84, 56) then Renders a orange box of size 51x118 starting at (247, 53).
; PLAN: r0=390(x1), r1=79(y1), r2=84(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=53(y), r7=51(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 79
LDI r2, 84
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 53
LDI r7, 51
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

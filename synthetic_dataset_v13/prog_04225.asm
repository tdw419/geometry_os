; DESCRIPTION: Composite: Draws a purple line from (273, 99) to (219, 71) then Draws a black rectangle at (106, 115) with width 110 and height 114.
; PLAN: r0=273(x1), r1=99(y1), r2=219(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=115(y), r7=110(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 99
LDI r2, 219
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 115
LDI r7, 110
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

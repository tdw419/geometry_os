; DESCRIPTION: Composite: Draws a red line from (117, 118) to (1, 233) then Creates a black circular shape at (156, 67) with radius 46.
; PLAN: r0=117(x1), r1=118(y1), r2=1(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=67(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 117
LDI r1, 118
LDI r2, 1
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 67
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

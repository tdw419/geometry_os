; DESCRIPTION: Composite: Draws a orange line from (126, 175) to (465, 190) then Creates a orange circular shape at (163, 92) with radius 53.
; PLAN: r0=126(x1), r1=175(y1), r2=465(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=92(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 175
LDI r2, 465
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 92
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

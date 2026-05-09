; DESCRIPTION: Composite: Draws a red line from (136, 124) to (55, 162) then Creates a purple circular shape at (343, 166) with radius 55.
; PLAN: r0=136(x1), r1=124(y1), r2=55(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=166(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 124
LDI r2, 55
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 166
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Draws a red line from (103, 89) to (335, 90) then Creates a magenta circular shape at (355, 200) with radius 33.
; PLAN: r0=103(x1), r1=89(y1), r2=335(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=200(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 89
LDI r2, 335
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 200
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
